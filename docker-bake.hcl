variable "TAG" {
  default = "latest"
}

variable "REGISTRY" {
  default = "mtaku3"
}

variable "IMAGE_NAME" {
  default = "argocd-toolset"
}

group "default" {
  targets = ["argocd-toolset"]
}

target "argocd-toolset" {
  context = "."
  dockerfile = "Dockerfile"
  tags = [
    "${REGISTRY}/${IMAGE_NAME}:${TAG}",
    "${REGISTRY}/${IMAGE_NAME}:latest"
  ]
  platforms = ["linux/amd64", "linux/arm64"]
}
