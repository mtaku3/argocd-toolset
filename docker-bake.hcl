variable "TAG" {
  default = "latest"
}

group "default" {
  targets = ["argocd-toolset"]
}

target "argocd-toolset" {
  context = "."
  dockerfile = "Dockerfile"
  platforms = ["linux/amd64", "linux/arm64"]
}
