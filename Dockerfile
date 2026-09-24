# ReLico artifact image — Phase 7.4: Docker packaging.
#
# Layer map:
#   - base skeleton: system toolchain (Ubuntu 24.04 + Java 21 + build tools).
#   - elan/Lean toolchain pinned by lean-toolchain (v4.32.1).
#   - 7.4.2 pinned ReLico dependencies: Maven 3.9.16 + RMC 2.14 + Rebeca
#     parser 2.25 + lfc 0.11.0 (via scripts/install-dependencies.sh --with-lfc).
#
# Design principle: Docker is packaging, not a second implementation. Each
# later layer reuses the existing artifact scripts
# (scripts/install-dependencies.sh, scripts/verify-environment.sh,
# smoke-test.sh, scripts/reproduce.sh) rather than duplicating their logic.
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
#   bash                                  -> artifact scripts use #!/usr/bin/env bash
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
        bash \
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

# ---------------------------------------------------------------------------
# 7.4.2: pinned external ReLico dependencies (Maven + install-dependencies.sh)
# ---------------------------------------------------------------------------
# Apache Maven 3.9.16 is installed from a pinned binary distribution to
# /opt/maven under the root user (system location), with SHA-256 verification,
# before switching back to the unprivileged user. apt is NOT used because
# reproducibility requires the exact pinned version.
#
# The SHA-256 is the tarball digest; it is cross-checked upstream against
# Apache's official SHA-512 (shared by downloads.apache.org and
# archive.apache.org for this release — see artifact/checksums.tsv).
USER root
RUN set -eux; \
    MAVEN_VERSION="3.9.16"; \
    MAVEN_SHA256="80ffca22aed9e8b9713a232f3394fd81d7f20322df75efdb2b047dbd3e3a23bb"; \
    MAVEN_BASEURL="https://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries"; \
    MAVEN_TAR="apache-maven-${MAVEN_VERSION}-bin.tar.gz"; \
    rm -rf /opt/maven; \
    mkdir -p /opt/maven; \
    curl -sSfL -o "/tmp/${MAVEN_TAR}" "${MAVEN_BASEURL}/${MAVEN_TAR}"; \
    echo "${MAVEN_SHA256}  /tmp/${MAVEN_TAR}" | sha256sum -c -; \
    tar -xzf "/tmp/${MAVEN_TAR}" -C /opt/maven --strip-components=1; \
    rm -f "/tmp/${MAVEN_TAR}"; \
    /opt/maven/bin/mvn --version
USER relico

# Maven on PATH for every shell layer and the verification step below.
ENV MAVEN_HOME=/opt/maven
ENV PATH=/opt/maven/bin:$PATH

# Repository working directory; the scripts COPY below lands here.
WORKDIR /home/relico/relico

# Copy in only the scripts needed to fetch the external artifacts, plus the
# lean-toolchain pin (verified by scripts/verify-environment.sh), so this
# cacheable layer stays small and stable (independent of source changes to the
# rest of the repo).
COPY --chown=relico:relico \
     scripts/install-dependencies.sh \
     scripts/verify-environment.sh \
     ./scripts/
COPY --chown=relico:relico lean-toolchain ./lean-toolchain

# Fetch RMC 2.14, Rebeca parser 2.25, and lfc 0.11.0 into the shared cache
# (~/.cache/relico) using the existing script's pinned SHAs. --with-lfc selects
# the platform-matched lfc archive; install-dependencies.sh extracts bin/lfc and
# verifies its SHA-256. Everything needed at runtime is now baked into the image
# — no downloads occur during docker run.
#
# Invoke the script explicitly under bash (not /bin/sh), because dash — Ubuntu
# 24.04's default /bin/sh — does not support `set -o pipefail` used by the
# script. bash was listed in the apt install set above for exactly this reason.
#
# The lfc binary is then symlinked into /usr/local/bin (requires root) so
# `which lfc` resolves regardless of build architecture. HOME is explicitly
# set to /home/relico so the cache lands in the relico user's directory (the
# script uses $HOME/.cache/relico by default), and ownership is preserved.
USER root
RUN export HOME=/home/relico; \
    bash scripts/install-dependencies.sh --with-lfc \
    && lfc_bin="$(find /home/relico/.cache/relico/lf -name lfc -type f | head -n 1)" \
    && [ -n "$lfc_bin" ] \
    && echo "lfc bin: $lfc_bin" \
    && echo "lfc bin sha256: $(shasum -a 256 "$lfc_bin" | cut -d' ' -f1)" \
    && ln -sf "$lfc_bin" /usr/local/bin/lfc \
    && chown -h relico:relico /usr/local/bin/lfc \
    && chown -R relico:relico /home/relico/.cache/relico
USER relico

# lfc is symlinked into /usr/local/bin (on the default PATH). Maven is in
# /opt/maven/bin (also on PATH). No lfc-specific cache paths needed here.

# Copy the full scripts directory so verify-environment.sh (and later
# smoke-test/reproduce layers) have every artifact script available.
COPY --chown=relico:relico scripts/ ./scripts/

# Run the environment verification gate for this layer. Use bash (not /bin/sh)
# so the script's `#!/usr/bin/env bash` shebang is respected and `set -o
# pipefail` works. Also confirm lfc and Maven resolve as expected.
RUN bash scripts/verify-environment.sh \
    && echo "=== lfc check ===" \
    && which lfc \
    && lfc --version \
    && echo "=== mvn check ===" \
    && which mvn \
    && mvn --version

# Default to an interactive shell so `docker run --rm -it relico` drops the
# reviewer at a prompt in the repo directory.
CMD ["/bin/bash"]
