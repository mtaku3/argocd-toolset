target "docker-metadata-action" {}

group "default" {
  targets = ["argocd-toolset"]
}

target "argocd-toolset" {
  inherits = ["docker-metadata-action"]
  context = "."
  dockerfile = "Dockerfile"
  platforms = [
    "linux/amd64",
    "linux/arm/v6",
    "linux/arm/v7",
    "linux/arm64",
    "linux/386"
  ]
}
