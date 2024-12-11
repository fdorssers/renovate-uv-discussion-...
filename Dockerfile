FROM debian:bookworm-slim AS linux-base

# renovate: datasource=pypi depName=uv
ARG UV_VERSION=0.5.8

RUN <<EOF
    apt update
    apt install -y --no-install-recommends build-essential ca-certificates curl make
    apt clean
    rm -rf /var/lib/apt/lists/*
EOF

ADD https://astral.sh/uv/${UV_VERSION}/install.sh /uv-installer.sh

RUN sh /uv-installer.sh && rm /uv-installer.sh

run dfd
