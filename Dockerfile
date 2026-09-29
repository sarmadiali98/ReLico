# ReLico artifact image — Phase 7.4: Docker packaging.
#
# Layer map:
#   - base skeleton: system toolchain (Ubuntu 24.04 + Java 21 + build tools).
#   - elan/Lean toolchain pinned by lean-toolchain (v4.32.1).
#   - 7.4.2 pinned ReLico dependencies: Maven 3.9.16 + RMC 2.14 + Rebeca
#     parser 2.25 + lfc 0.11.0 (via scripts/install-dependencies.sh --with-lfc).
#   - 7.4.2b LF verifier toolchain: Z3 4.8.8 (with Java bindings) + UCLID5
#     (built from the commit used by lf-verifier-benchmarks), for the lfc
#     C-target verify path. Added to support future LF verifier experiments.
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
#   openjdk-17-jdk                        -> builds UCLID5 (sbt 1.x + UCLID5 at
#                                            the pinned commit target Java 17;
#                                            Java 21 removed the SecurityManager
#                                            the sbt launcher relies on)
#   python3                               -> test/benchmark harness (stdlib only)
#   git                                   -> repo-root resolution in runners
#   curl, ca-certificates                 -> fetch elan (and pinned deps later)
#   wget                                   -> Z3 download script (get-z3-linux.sh)
#   unzip, tar, xz-utils                  -> archive extraction (parser zip, lfc
#                                            tarball, elan/Lean distributions,
#                                            Z3, UCLID5)
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
        wget \
        unzip \
        tar \
        xz-utils \
        default-jdk \
        openjdk-17-jdk \
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

# ---------------------------------------------------------------------------
# 7.4.2b: LF verifier toolchain — Z3 + UCLID5 (for the lfc C-target verify path)
# ---------------------------------------------------------------------------
# The generated LF source uses `target Cpp`, which lfc 0.11.0's verify stage
# does not support. The verifier path currently works only with the C target,
# which uses UCLID5 as its backend and Z3 as the SMT solver. These tools are
# needed for future LF verifier experiments (e.g., the manual C-target path
# validated in the prior ReLico verification experiment).
#
# Z3 4.8.8 is the version UCLID5 pins at the target commit (get-z3-linux.sh).
# The x64 release includes libz3java.so and com.microsoft.z3.jar (Java bindings)
# that UCLID5 loads via the JVM, plus libz3.so and the z3 binary. SHA-256 is
# verified against the release artifact digest.
#
# UCLID5 is built from source at the commit used by lf-verifier-benchmarks
# (4fd5e566c5f87b052f92e9b23723a85e1c4d8c1c), via the sbt build tool. The build
# uses Java 17 (openjdk-17-jdk installed above), because Java 21 removed the
# SecurityManager the sbt launcher relies on; sbt 1.x is installed from a pinned
# binary release.
USER root

# Z3 4.8.8 with Java bindings (libz3java.so, com.microsoft.z3.jar).
# This is the exact Z3 version UCLID5 pins at the target commit
# (get-z3-linux.sh -> Z3 4.8.8). The UCLID5 sources at this commit compile only
# against this Z3 API (later Z3 made com.microsoft.z3.Expr generic, which breaks
# the build). This image targets Linux x86_64, the platform for which the LF
# verifier and UCLID5 ship Z3 (Z3 4.8.8 has no upstream Linux arm64 build). The
# com.microsoft.z3.jar is pure Java (architecture-neutral) and is what UCLID5
# compiles against; the native z3 binary and libz3*.so are x86_64 and are
# exercised at verification time on the x86_64 target. The z3 binary is only
# executed here when the build host is x86_64, so the image layers still build
# on an arm64 host (e.g. Apple Silicon) for inspection while remaining fully
# functional on the x86_64 target.
RUN set -eux; \
    Z3_VERSION="4.8.8"; \
    Z3_SHA256="6534f26427ee4f02835d17c3472f5ce750f34b4898c35cdd4223459b3589664e"; \
    Z3_ASSET="z3-${Z3_VERSION}-x64-ubuntu-16.04.zip"; \
    Z3_URL="https://github.com/Z3Prover/z3/releases/download/z3-${Z3_VERSION}/${Z3_ASSET}"; \
    rm -rf /tmp/z3-install; \
    mkdir -p /tmp/z3-install; \
    curl -sSfL -o "/tmp/${Z3_ASSET}" "$Z3_URL"; \
    echo "${Z3_SHA256}  /tmp/${Z3_ASSET}" | sha256sum -c -; \
    unzip -q "/tmp/${Z3_ASSET}" -d /tmp/z3-install; \
    Z3_DIR="$(find /tmp/z3-install -maxdepth 1 -type d -name "z3-${Z3_VERSION}-*" | head -n 1)"; \
    rm -f "/tmp/${Z3_ASSET}"; \
    rm -rf /opt/z3; \
    mkdir -p /opt/z3; \
    cp -r "$Z3_DIR/bin"/* /opt/z3/; \
    rm -rf /tmp/z3-install; \
    ls /opt/z3/libz3.so /opt/z3/libz3java.so /opt/z3/com.microsoft.z3.jar; \
    if [ "$(uname -m)" = "x86_64" ]; then \
        LD_LIBRARY_PATH=/opt/z3 /opt/z3/z3 --version; \
    else \
        echo "NOTE: build host $(uname -m) is not x86_64; skipping z3 binary execution (native z3 runs on the x86_64 target)"; \
    fi

# Install sbt (Scala build tool) from a pinned binary release.
# Used to compile UCLID5 from source. sbt 1.x is required: UCLID5 at the pinned
# commit is a sbt 1.x project, and the sbt 2.x launcher cannot build it.
RUN set -eux; \
    SBT_VERSION="1.10.11"; \
    SBT_SHA256="5034a64841b8a9cfb52a341e45b01df2b8c2ffaa87d8d2b0fe33c4cdcabd8f0c"; \
    SBT_URL="https://github.com/sbt/sbt/releases/download/v${SBT_VERSION}/sbt-${SBT_VERSION}.tgz"; \
    rm -rf /tmp/sbt-install /opt/sbt; \
    mkdir -p /tmp/sbt-install; \
    curl -sSfL -o "/tmp/sbt-${SBT_VERSION}.tgz" "$SBT_URL"; \
    echo "${SBT_SHA256}  /tmp/sbt-${SBT_VERSION}.tgz" | sha256sum -c -; \
    tar -xzf "/tmp/sbt-${SBT_VERSION}.tgz" -C /tmp/sbt-install --strip-components=1; \
    rm -f "/tmp/sbt-${SBT_VERSION}.tgz"; \
    mkdir -p /opt/sbt; \
    cp -r /tmp/sbt-install/* /opt/sbt/; \
    rm -rf /tmp/sbt-install

# Build UCLID5 from source at the pinned commit used by lf-verifier-benchmarks.
# This is the verifier backend for lfc's C-target `verify` stage.
# UCLID5's get-z3-linux.sh normally copies the Z3 Java bindings jar into the
# project's lib/ before building; we reproduce just that step (the jar is
# architecture-neutral Java) instead of re-downloading Z3, since Z3 is already
# installed at /opt/z3 above. The sbt compile itself is JVM-only and therefore
# architecture-independent.
RUN set -eux; \
    UCLID_COMMIT="4fd5e566c5f87b052f92e9b23723a85e1c4d8c1c"; \
    cd /tmp; \
    git clone https://github.com/uclid-org/uclid.git uclid-src; \
    cd uclid-src; \
    git checkout "$UCLID_COMMIT"; \
    mkdir -p lib; \
    cp /opt/z3/com.microsoft.z3.jar lib/; \
    export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-"$(dpkg --print-architecture)"; \
    export SBT_HOME=/opt/sbt; \
    export PATH="${JAVA_HOME}/bin:${SBT_HOME}/bin:${PATH}"; \
    java -version; \
    sbt update clean compile "set fork:=true"; \
    sbt universal:packageBin; \
    cd target/universal; \
    unzip -q uclid-0.9.5.zip -d /opt/uclid-dist; \
    rm -rf /tmp/uclid-src

# Symlink uclid and z3 into /usr/local/bin, and set library path for Java
# bindings. Java 21 is already on PATH from the base image.
RUN set -eux; \
    ln -sf /opt/uclid-dist/uclid-0.9.5/bin/uclid /usr/local/bin/uclid; \
    ln -sf /opt/z3/z3 /usr/local/bin/z3; \
    chown -R relico:relico /opt/uclid-dist /opt/sbt /opt/z3

# Z3 shared libraries must be on LD_LIBRARY_PATH for UCLID5 (via JNI) and
# for lfc's C-target verifier to find libz3java.so at runtime. LD_LIBRARY_PATH
# is not otherwise set in this image, so a plain assignment is correct here.
ENV LD_LIBRARY_PATH=/opt/z3
ENV PATH=/usr/local/bin:${PATH}
USER relico

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
    && mvn --version \
    && echo "=== uclid check ===" \
    && which uclid \
    && echo "=== z3 check ===" \
    && which z3 \
    && if [ "$(uname -m)" = "x86_64" ]; then z3 --version && uclid --help 2>&1 | head -1; else echo "NOTE: skipping z3/uclid execution on $(uname -m) (native z3 runs on the x86_64 target)"; fi

# ---------------------------------------------------------------------------
# 7.4.3: build-time warmup — prepare the container so `docker run` needs no net
# ---------------------------------------------------------------------------
# Copy the full artifact source last (after the expensive, rarely-changing
# dependency layers above) so ordinary source edits do not invalidate the elan,
# Maven, or install-dependencies layers. .dockerignore keeps derived state
# (.lake, build outputs, .git, test evidence) out of the context.
COPY --chown=relico:relico . .

# The parser-bridge runners (frontend/java-bridge/*.sh) resolve the repository
# root with `git rev-parse --show-toplevel`, and .dockerignore excludes .git
# from the build context. Initialize a minimal repository at the workdir so that
# resolution succeeds; only the working-tree root is needed (no history/commits,
# no remotes), so this adds no network dependency and no repo state to trust.
USER root

RUN chown -R relico:relico /home/relico/relico

USER relico

RUN git init -q . \
    && git config user.email relico@artifact.local \
    && git config user.name relico

# Build-time warmup, split into two layers so the expensive, rarely-changing
# Lean build is cached independently of the (cheaper) translation warmup.
#
# Layer 1 — Lean build. Warm the complete Lean build cache (.lake/) in place.
# `lake build Relico` builds the default library target, which globs every
# module the reviewer workflow relies on — in particular the Relico.Frontend.*
# decoders and Relico.Benchmark.* artifact exporters that the analyze/translate
# stages load with `lake env lean --run`. That runner loads imports from their
# .olean files and does NOT compile them on demand, so those oleans must already
# exist; a clean container has no pre-populated .lake, unlike a dev host.
# RelicoTests is the proof-verification aggregate that smoke-test.sh [2/6] and
# reproduce.sh stage 1 build; warming it here too makes those gates cache hits
# offline. Building both leaves .lake/ fully populated, so the offline
# `docker run` never needs to compile Lean. This is a build warmup (no pipeline
# logic); the reviewer scripts still run verbatim below and offline.
RUN lake build Relico RelicoTests

# Layer 2 — translation/runtime warmup. The smoke test is the reviewer's fast
# end-to-end path and drives every remaining stage that pulls in a cacheable
# dependency:
#   - parser bridge (mvn)  -> resolves the compiler project's full dependency
#                             closure into the Maven local repo (~/.m2)
#   - DTR model checking   -> exercises the cached RMC 2.14 jar (java, g++)
#   - LF compilation (lfc) -> exercises the pinned lfc 0.11.0 + C/C++ toolchain
#   - example execution    -> runs the generated native binary
# Its [2/6] Lean build re-uses the cache warmed above (incremental, fast).
# Running it here (docker build has network) bakes these caches into the image
# layer, so `docker run --network none` finds everything already present. This
# reuses the existing script verbatim; it adds no pipeline logic and writes only
# to /tmp (nothing into the repository), keeping the image layer clean.
RUN bash smoke-test.sh

# Default to an interactive shell so `docker run --rm -it relico` drops the
# reviewer at a prompt in the repo directory.
CMD ["/bin/bash"]
