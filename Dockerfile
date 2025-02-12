# Source: https://alexbrand.dev/post/how-to-package-rust-applications-into-minimal-docker-containers/,

# Dockerfile for creating a statically-linked Rust application using docker's
# multi-stage build feature. This also leverages the docker build cache to avoid
# re-downloading dependencies if they have not changed.
FROM rust:latest AS builder

LABEL maintainer Claudius Teodorescu <claudius.teodorescu@gmail.com>

WORKDIR /usr/src/

# Download the target for static linking.
RUN rustup target add x86_64-unknown-linux-musl

# Create a dummy project and build the app's dependencies.
# If the Cargo.toml or Cargo.lock files have not changed,
# we can use the docker build cache and skip these (typically slow) steps.
RUN USER=root cargo new dummy-app
WORKDIR /usr/src/dummy-app
COPY Cargo.toml Cargo.lock ./
RUN cargo build --release

COPY src ./src
COPY templates ./templates
RUN cargo install --target x86_64-unknown-linux-musl --path .

# Copy the statically-linked binary into a scratch container.
FROM scratch
COPY --from=builder /usr/local/cargo/bin/deciduously-com .
USER 1000
CMD ["./deciduously-com", "-a", "0.0.0.0", "-p", "8080"]
