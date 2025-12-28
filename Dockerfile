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
# Map Docker TARGETARCH to yq binary naming
RUN case "${TARGETARCH}" in \
        amd64) YQ_ARCH="amd64" ;; \
        arm64) YQ_ARCH="arm64" ;; \
        386) YQ_ARCH="386" ;; \
        ppc64le) YQ_ARCH="ppc64le" ;; \
        s390x) YQ_ARCH="s390x" ;; \
        *) echo "Unsupported architecture for yq: ${TARGETARCH}" && exit 1 ;; \
    esac && \
    curl -L "https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_${YQ_ARCH}" -o /usr/local/bin/yq && \
    chmod +x /usr/local/bin/yq

# Install kustomize
ARG KUSTOMIZE_VERSION=v5.8.0
# Map Docker TARGETARCH to kustomize arch naming
RUN case "${TARGETARCH}" in \
        amd64) KUSTOMIZE_ARCH="amd64" ;; \
        arm64) KUSTOMIZE_ARCH="arm64" ;; \
        ppc64le) KUSTOMIZE_ARCH="ppc64le" ;; \
        s390x) KUSTOMIZE_ARCH="s390x" ;; \
        *) echo "Unsupported architecture: ${TARGETARCH}" && exit 1 ;; \
    esac && \
    curl -L "https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2F${KUSTOMIZE_VERSION}/kustomize_${KUSTOMIZE_VERSION}_linux_${KUSTOMIZE_ARCH}.tar.gz" | \
    tar xz -C /usr/local/bin && \
    chmod +x /usr/local/bin/kustomize

# Install helm
ARG HELM_VERSION=v4.0.4
# Map Docker TARGETARCH to Helm arch naming
RUN case "${TARGETARCH}" in \
        amd64) HELM_ARCH="amd64" ;; \
        arm64) HELM_ARCH="arm64" ;; \
        ppc64le) HELM_ARCH="ppc64le" ;; \
        s390x) HELM_ARCH="s390x" ;; \
        386) HELM_ARCH="386" ;; \
        *) echo "Unsupported architecture for helm: ${TARGETARCH}" && exit 1 ;; \
    esac && \
    curl -L "https://get.helm.sh/helm-${HELM_VERSION}-linux-${HELM_ARCH}.tar.gz" | \
    tar xz -C /tmp && \
    mv /tmp/linux-${HELM_ARCH}/helm /usr/local/bin/helm && \
    chmod +x /usr/local/bin/helm && \
    rm -rf /tmp/linux-${HELM_ARCH}

# Set bash as default shell
SHELL ["/bin/bash", "-c"]

# Verify installations
RUN bash --version && \
    yq --version && \
    kustomize version && \
    helm version

CMD ["/bin/bash"]
