FROM jenkins/jnlp-slave:alpine

USER root

# Install glibc compatibility to resolve conflicts
RUN apk update && apk upgrade && apk add --no-cache \
    curl \
    gnupg \
    ca-certificates \
    bash \
    docker \
    wget

RUN apk add --no-cache curl && \
    curl -fsSL https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.31-r0/glibc-2.31-r0.apk -o /tmp/glibc.apk && \
    apk add --allow-untrusted /tmp/glibc.apk && \
    rm -rf /tmp/glibc.apk

# Ensure Docker permissions for Jenkins
RUN addgroup -S docker || true && adduser jenkins docker || true

# Install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && mv kubectl /usr/local/bin/

USER jenkins
