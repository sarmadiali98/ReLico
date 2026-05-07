FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    openjdk-17-jdk \
    maven \
    bash \
    findutils \
    coreutils \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /artifact

COPY . /artifact

# During image build, download/cache Maven dependencies and the exec plugin.
# The container's default runtime command then uses Maven offline mode.
RUN mvn -B -DskipTests dependency:go-offline \
    && mvn -B org.codehaus.mojo:exec-maven-plugin:3.1.0:help \
    && mvn -B -DskipTests clean package

CMD ["./scripts/docker_smoke_test.sh"]
