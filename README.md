# ArgoCD Toolset Image

Docker image containing essential tools for ArgoCD workflows:
- **bash**: Command-line shell
- **yq**: YAML processor
- **kustomize**: Kubernetes configuration customization tool

## Docker Hub

The image is available on Docker Hub: `mtaku3/argocd-toolset`

## Usage

Pull and run the image:

```bash
docker pull mtaku3/argocd-toolset:latest
docker run -it mtaku3/argocd-toolset:latest
```

## Included Tools

- **bash**: Shell for scripting and command execution
- **yq** (v4.40.5): Command-line YAML/XML/JSON processor
- **kustomize** (v5.3.0): Kubernetes native configuration management
- **git**: Version control system
- **curl**: Data transfer tool

## Building Locally

Build the image using Docker Bake:

```bash
docker buildx bake
```

Build with a specific tag:

```bash
TAG=v1.0.0 docker buildx bake
```

## GitHub Actions

The image is automatically built and pushed to Docker Hub using `docker/metadata-action` for intelligent tagging:

**On push to `main` branch:**
- Tagged as `main` and `latest`

**On version tags (e.g., `v1.2.3`):**
- `1.2.3` (full version)
- `1.2` (major.minor)
- `1` (major)

**On pull requests:**
- Tagged as `pr-<number>` (for testing, not pushed)

The workflow includes:
- Multi-architecture builds (amd64, arm/v6, arm/v7, arm64, 386)
- GitHub Actions cache for faster builds
- Automatic tag generation based on git refs

### Required Secrets

Configure the following secrets in your GitHub repository:
- `DOCKERHUB_USERNAME`: Your Docker Hub username
- `DOCKERHUB_TOKEN`: Your Docker Hub access token

## Multi-Architecture Support

The image is built for multiple architectures:
- `linux/amd64` (64-bit Intel/AMD)
- `linux/arm/v6` (ARMv6, e.g., Raspberry Pi 1)
- `linux/arm/v7` (ARMv7, e.g., Raspberry Pi 2/3)
- `linux/arm64` (64-bit ARM, e.g., Raspberry Pi 4)
- `linux/386` (32-bit Intel/AMD)

## License

MIT License - see [LICENSE](LICENSE) file for details.
