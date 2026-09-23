# ReLico artifact image — Step 7.4.1: base environment skeleton.
#
# Scope of THIS layer (intentionally minimal):
#   Ubuntu 24.04 + system build tools + Java + Python + elan/Lean toolchain.
#
# Deliberately NOT here yet (added in later, separate commits):
#   - Apache Maven 3.9.16                     (Step 7.4.2)
#   - RMC 2.14 / Rebeca parser 2.25 / lfc     (Step 7.4.2, via
#     scripts/install-dependencies.sh --with-lfc)
#   - Maven (~/.m2) + Lean build warm-up      (Step 7.4.3)
#   - smoke test / offline reproduction       (Step 7.4.3)
#
# Design principle: Docker is packaging, not a second implementation. Later
# steps reuse the existing artifact scripts (scripts/install-dependencies.sh,
# scripts/verify-environment.sh, smoke-test.sh, scripts/reproduce.sh) rather
# than duplicating their logic here.
#
# Base rationale (Phase 7.2 / 7.4 audit): Ubuntu 24.04 matches the CI
# environment (leanprover/lean-action on ubuntu-latest), provides a glibc
# compatible with elan-distributed Lean, and has good package availability.
FROM ubuntu:24.04

# Non-interactive apt for reproducible, log-clean builds.
ENV DEBIAN_FRONTEND=noninteractive

# System packages:
#   build-essential + g++ + make + cmake  -> C/C++ toolchain (lfc-generated and
#                                            RMC-generated C++ builds, later)
#   default-jdk (OpenJDK 21 on 24.04)     -> runs Maven, lfc, RMC (>= 17 required)
#   python3                               -> test/benchmark harness (stdlib only)
#   git                                   -> repo-root resolution in runners
#   curl, ca-certificates                 -> fetch elan (and pinned deps later)
#   unzip, tar, xz-utils                  -> archive extraction (parser zip, lfc
#                                            tarball, elan/Lean distributions)
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        cmake \
        make \
        g++ \
        git \
        curl \
        ca-certificates \
        unzip \
        tar \
        xz-utils \
        default-jdk \
        python3 \
    && rm -rf /var/lib/apt/lists/*

# Run as an unprivileged reviewer user with a writable HOME. Later steps place
# the per-user caches the artifact scripts expect (~/.cache/relico, ~/.m2)
# under this HOME.
RUN useradd --create-home --shell /bin/bash relico
USER relico

# elan (the Lean toolchain manager) installs into the user HOME; put its shims
# on PATH for every subsequent layer and for interactive shells.
ENV ELAN_HOME=/home/relico/.elan
ENV PATH=/home/relico/.elan/bin:$PATH

# The repository is mounted/copied under this path in later steps.
WORKDIR /home/relico/relico

# Install elan and the exact Lean toolchain pinned by lean-toolchain
# (leanprover/lean4:v4.32.1). Only the pin file is copied here so this
# expensive, rarely-changing layer stays cached independently of source
# changes. elan resolves `lean` and `lake` from the pinned toolchain.
COPY --chown=relico:relico lean-toolchain ./lean-toolchain
RUN curl -sSfL https://elan.lean-lang.org/elan-init.sh \
      | sh -s -- -y --default-toolchain "$(cat lean-toolchain)" \
    && elan default "$(cat lean-toolchain)" \
    && lean --version \
    && lake --version

# Default to an interactive shell so `docker run --rm -it relico` drops the
# reviewer at a prompt in the repo directory.
CMD ["/bin/bash"]
