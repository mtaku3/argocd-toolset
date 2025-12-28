FROM alpine:3.19

# Install bash and required dependencies
RUN apk add --no-cache \
    bash \
    curl \
    ca-certificates \
    git

# Install yq
ARG TARGETARCH
ARG YQ_VERSION=v4.40.5
RUN curl -L "https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_${TARGETARCH}" -o /usr/local/bin/yq && \
    chmod +x /usr/local/bin/yq

# Install kustomize
ARG KUSTOMIZE_VERSION=v5.3.0
RUN curl -L "https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2F${KUSTOMIZE_VERSION}/kustomize_${KUSTOMIZE_VERSION}_linux_${TARGETARCH}.tar.gz" | \
    tar xz -C /usr/local/bin && \
    chmod +x /usr/local/bin/kustomize

# Set bash as default shell
SHELL ["/bin/bash", "-c"]

# Verify installations
RUN bash --version && \
    yq --version && \
    kustomize version

CMD ["/bin/bash"]
