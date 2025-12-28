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

The image is automatically built and pushed to Docker Hub on:
- Push to `main` branch (tagged as `latest`)
- Git tags starting with `v*` (tagged with the version)
- Manual workflow dispatch

### Required Secrets

Configure the following secrets in your GitHub repository:
- `DOCKERHUB_USERNAME`: Your Docker Hub username
- `DOCKERHUB_TOKEN`: Your Docker Hub access token

## Multi-Architecture Support

The image is built for multiple architectures:
- `linux/amd64`
- `linux/arm64`

## License

MIT License - see [LICENSE](LICENSE) file for details.
