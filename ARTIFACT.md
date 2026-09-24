# ReLico Artifact Quick Start

This is the reviewer-facing entry point for the ReLico artifact. It gives the
shortest verified path from a clean checkout to a reproduced result. For the
conceptual overview, scope, and formal claims, read [`README.md`](README.md)
first; for the exact trusted boundary see
[`docs/trusted-boundary.md`](docs/trusted-boundary.md).

Every script below writes only to a temporary output directory and never
modifies the repository.

## Two ways to review this artifact

There are two supported paths, and they run the *same* reviewer scripts:

- **Docker (recommended).** A prebuilt image contains every tool, pinned to the
  exact version used for the reported results. You install Docker once, build
  the image, and run the reviewer commands inside it. No Lean, Java, Maven,
  `lfc`, or C++ setup on your machine. Start at
  [1. Reviewing with Docker](#1-reviewing-with-docker-recommended).
- **Native checkout.** You install the external toolchain on your own machine
  and run the scripts directly. Start at
  [2. Reviewing on a native checkout](#2-reviewing-on-a-native-checkout).

If you have never used Lean, Lingua Franca, Timed Rebeca, or Docker, use the
Docker path: it is designed so you do not need to understand any of them to
reproduce the artifact.

---

## 1. Reviewing with Docker (recommended)

### 1.1 What Docker is, in one paragraph

Docker packages a program together with the exact operating system, tools, and
libraries it needs into a single **image**. When you *run* an image you get a
**container**: an isolated mini-environment that behaves identically on any
machine. For a reviewer this means you do not install Lean, Java, Maven, the
Lingua Franca compiler, or a C++ compiler yourself — they are already inside the
image at the exact versions we tested. You install Docker, build the image once,
and everything else runs the same way on macOS, Windows, or Linux.

### 1.2 Why ReLico ships a Docker image

Reproducing this artifact natively requires several tools at specific versions
(Lean 4.32.1, a Java JDK, Apache Maven, `lfc` 0.11.0, a C++ toolchain, Python).
Getting all of them installed and visible on your machine is the most
error-prone part of any artifact review. The Docker image removes that step: it
pins every version, downloads and checksum-verifies each dependency once at
build time, and gives you a ready-to-use shell. This makes the evaluation
reproducible and lets the reviewer commands run **fully offline**.

### 1.3 Install Docker

Install Docker Desktop (macOS and Windows) or Docker Engine (Linux) by following
the official guide: <https://docs.docker.com/get-docker/>. When it is installed,
confirm it works:

```bash
docker --version        # prints e.g. "Docker version 27.x.x"
docker run hello-world   # prints a short confirmation message
```

If `docker run hello-world` prints a welcome message, Docker is ready. On Linux
you may need to start the Docker service or add your user to the `docker` group;
the install guide explains both.

### 1.4 Build the image

From the root of this repository (the directory containing `Dockerfile`):

```bash
docker build -t relico .
```

`-t relico` names the image `relico`; the trailing `.` tells Docker to build
using the `Dockerfile` in the current directory. The first build takes several
minutes because it installs the toolchain, downloads the pinned dependencies,
and warms the Lean and translation caches (see
[1.9 What happens during the build](#19-what-happens-during-the-build)). Later
builds reuse cached layers and are much faster.

You need a working internet connection **for this step only**. Everything the
reviewer runs afterward is baked into the image.

### 1.5 Run the container

```bash
docker run --rm -it relico
```

This drops you at a shell prompt **inside** the container, already in the ReLico
repository directory. What the flags mean:

- `--rm` removes the container when you exit, leaving no clutter.
- `-it` gives you an interactive terminal.
- `relico` is the image you built.

You are now in the artifact. Type `exit` (or press Ctrl-D) to leave; because of
`--rm`, the container is discarded and your machine is unchanged.

### 1.6 Run the smoke test

Inside the container:

```bash
./smoke-test.sh
```

This is a fast, six-gate, end-to-end check (environment, Lean build, model
analysis, DTR model checking, LF compilation, and native execution of a tiny
bundled model). It takes a few seconds because the image is pre-warmed. A
successful run ends with exactly:

```text
Artifact status: READY
```

That line is the pass signal. If instead you see `Artifact status: NOT READY`,
the output names the failed gate, a hint, and a log path; see
[1.10 Troubleshooting](#110-troubleshooting).

### 1.7 Reproduce the evaluation

Still inside the container:

```bash
scripts/reproduce.sh --profile quick   # representative reviewer slice (a few minutes)
scripts/reproduce.sh --profile full    # complete evaluation (all fixtures + benchmarks)
```

Each run prints a per-stage log and finishes with two machine-readable lines:

```text
REPRODUCE_SUMMARY=/tmp/relico-reproduce.<timestamp>/summary.txt
REPRODUCE_TEST=pass
```

`REPRODUCE_TEST=pass` is the pass signal. The `quick` profile runs the
environment check, the formal build, a representative slice of the translator
fixtures, the smallest benchmarks, and the ESP32 virtual-hardware case study.
The `full` profile runs all 65 translator capability fixtures and all 41
application benchmarks. See [`evaluation/README.md`](evaluation/README.md) for
the evidence populations and counting rules, and
[`benchmarks/README.md`](benchmarks/README.md) for the benchmark suite.

Putting the whole Docker path together:

```bash
docker build -t relico .               # once, with internet
docker run --rm -it relico             # open a shell in the artifact
./smoke-test.sh                        # -> Artifact status: READY
scripts/reproduce.sh --profile quick   # -> REPRODUCE_TEST=pass
```

### 1.8 Offline execution

Because every dependency is baked into the image at build time, the reviewer
commands need no network access. To prove this, start the container with
networking disabled:

```bash
docker run --rm -it --network none relico
```

Then inside the container run the same commands as above:

```bash
./smoke-test.sh                        # -> Artifact status: READY
scripts/reproduce.sh --profile quick   # -> REPRODUCE_TEST=pass
```

Both succeed with no internet access: the RMC jar, the Rebeca parser archive,
`lfc`, Maven and its downloaded dependencies, and the Lean build cache are all
already present in the image.

You can also run a single command without opening an interactive shell — for
example, a fully offline smoke test in one line:

```bash
docker run --rm --network none relico ./smoke-test.sh
```

### 1.9 What happens during the build

`docker build` runs the steps in `Dockerfile` in order:

1. **System toolchain.** Starts from Ubuntu 24.04 and installs a C/C++ compiler,
   `make`, `cmake`, a Java JDK, Python, `git`, and archive tools.
2. **Lean toolchain.** Installs `elan` (the Lean version manager) and the exact
   Lean 4.32.1 pinned in `lean-toolchain`.
3. **Pinned dependencies.** Installs Apache Maven 3.9.16, then runs the project's
   own `scripts/install-dependencies.sh --with-lfc` to download **and SHA-256
   verify** the Rebeca Model Checker 2.14, the Rebeca parser 2.25, and `lfc`
   0.11.0 into a cache inside the image. Exact versions, sources, and checksums
   are in [`DEPENDENCIES.md`](DEPENDENCIES.md).
4. **Warmup.** Builds the Lean development (`lake build Relico RelicoTests`),
   populates the Maven local repository, and runs the smoke test once — all
   while the build still has network access. This bakes every cache into the
   image so the reviewer's later runs need no downloads.

**Why dependencies are downloaded during the build, not committed to the repo:**
the artifact does not ship any third-party binaries in its source tree. Each
external tool is fetched from its official upstream release and checksum-verified
during `docker build`, so what ends up in the image is transparent and
reproducible rather than an opaque committed blob.

**Why runtime needs no internet:** all of those downloads and cache warmups
happen at build time. By the time you `docker run`, the parser, RMC, `lfc`,
Maven dependencies, and the Lean build outputs are already inside the image,
which is exactly why `docker run --network none` works.

### 1.10 Troubleshooting

- **`docker: command not found`** — Docker is not installed or not on your
  `PATH`. Reinstall from <https://docs.docker.com/get-docker/> and re-run
  `docker --version`.
- **`Cannot connect to the Docker daemon`** — the Docker service is not running.
  Start Docker Desktop (macOS/Windows) or start the Docker service (Linux), then
  retry.
- **`permission denied` while connecting to the daemon (Linux)** — add your user
  to the `docker` group (`sudo usermod -aG docker "$USER"`) and start a new
  shell, or prefix commands with `sudo`.
- **The build fails while downloading a dependency** — this step needs internet
  and access to the upstream release hosts (GitHub releases, Maven Central,
  Apache archive). Check connectivity or a proxy, then re-run `docker build`;
  cached layers make the retry fast.
- **`no space left on device`** — the image and its caches need several GB.
  Reclaim space with `docker system prune` and rebuild.
- **The first `lake build` seems to hang** — a cold Lean build takes several
  minutes; the image warms it at build time so reviewer runs are fast. If it is
  slow during `docker build`, that is expected once.
- **A smoke-test gate fails** — the output names the failed gate, a hint, and a
  log path under `/tmp/relico-artifact-smoke.<pid>/`. Inspect that log; inside
  the image the toolchain is pinned, so failures usually indicate a resource
  limit (memory/disk) rather than a missing tool.

---

## 2. Reviewing on a native checkout

Use this path only if you prefer not to use Docker. It requires you to install
the external toolchain yourself.

### 2.0 What you need

The Lean toolchain is pinned in `lean-toolchain` and installed via `elan`.
Source-to-runtime execution additionally needs an external toolchain: a Java
JDK 17+, Apache Maven, `lfc` 0.11.0, a C++ compiler with `cmake`/`make`, and
Python 3.10+. Exact versions, sources, checksums, and licenses are listed in
[`DEPENDENCIES.md`](DEPENDENCIES.md).

### 2.1 Install and verify the toolchain

```bash
# Downloads lfc, the RMC jar, and the pinned parser archive into ~/.cache/relico
# (no system-wide install). Omit and install manually if you prefer.
scripts/install-dependencies.sh

# Confirms every required tool is visible and reports its version.
scripts/verify-environment.sh
```

If a tool lives somewhere non-standard, point the matching `RELICO_*` variable
at it (see the environment-variable table in [`DEPENDENCIES.md`](DEPENDENCIES.md)).

### 2.2 Run the smoke test

```bash
./smoke-test.sh
```

One command, six gates, a few seconds warm: environment check, Lean build,
`scripts/relico analyze`, DTR model checking, LF compilation, and native
execution of the bundled `examples/smoke/minimal.rebeca`. A successful run ends
with:

```text
Artifact status: READY
```

This is a fast end-to-end confidence check, not the full evaluation. Add
`--verbose` to print captured tool versions. Logs land under
`/tmp/relico-artifact-smoke.<pid>/`.

### 2.3 Run an example through the workflow

```bash
scripts/relico analyze examples/smoke/minimal.rebeca
scripts/relico run     examples/smoke/minimal.rebeca
```

`analyze` accepts the model, reports the supported fragment, and validates
priorities (parse and decode only). `run` drives the full verified pipeline —
analyze, DTR model checking, translation to LF, `lfc` compilation, and a short
runtime — and writes a machine-readable `report.json` into its output
directory. Committed example outputs and a field-by-field explanation are in
the [user workflow guide](examples/workflow/README.md).

### 2.4 Reproduce the evaluation

```bash
scripts/reproduce.sh                 # quick reviewer profile (default)
scripts/reproduce.sh --profile full  # complete evaluation
```

The quick profile runs the environment check, the formal build, a
representative slice of the translator fixtures, the smallest benchmarks, and
the ESP32 virtual-hardware case study. The full profile runs all 65 translator
capability fixtures and all 41 application benchmarks. The full profile stays
offline provided the parser archive is already cached (step 2.1). A successful
run ends with `REPRODUCE_TEST=pass`. See
[`evaluation/README.md`](evaluation/README.md) for the evidence populations and
counting rules, and [`benchmarks/README.md`](benchmarks/README.md) for the
benchmark suite.

### 2.5 Reproduce the ESP32 case study (optional)

```bash
lfc esp32/smarthome/hardware/smarthome.lf
esp32/smarthome/scenario/run_virtual_hardware.sh --all
```

The complete reproduction commands, checksums, and evidence roles are in
[`esp32/smarthome/README.md`](esp32/smarthome/README.md) and
[`esp32/smarthome/docs/ARTIFACT_REPRODUCTION.md`](esp32/smarthome/docs/ARTIFACT_REPRODUCTION.md).

---

## Where results and logs go

| Script | Output location |
|---|---|
| `./smoke-test.sh` | `/tmp/relico-artifact-smoke.<pid>/` |
| `scripts/relico ...` | `/tmp/relico-workflow.<timestamp>/` (override with `--out`) |
| `scripts/reproduce.sh` | `/tmp/relico-reproduce.<timestamp>/` (override with `--results`) |

Inside a Docker container these paths live in the container's own `/tmp` and are
discarded when the container exits (`--rm`). To keep results on your host,
mount a directory, e.g. `docker run --rm -it -v "$PWD/out:/tmp/out" relico` and
pass `--results /tmp/out` to `scripts/reproduce.sh`.

## Native troubleshooting

- A cold first `lake build` can take several minutes; the smoke test surfaces
  this as the Lean-build gate.
- `scripts/verify-environment.sh` names any missing tool; re-run
  `scripts/install-dependencies.sh` or install it manually, then retry.
- A bare `mvn` on `PATH` may be an unrelated tool. Set `RELICO_MAVEN` to the
  real Apache Maven binary if the environment check rejects it.
