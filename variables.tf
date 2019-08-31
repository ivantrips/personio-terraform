variable "service_file" {
  default = "service-account.json"
}

variable "k8s_project" {
  default = "personio-test-ivan"
}

variable "region" {
  default = "us-central1"
}

variable "zone" {
  default = "us-central1-a"
}

variable "cluster_name" {
  default = "sre-test"
}

variable "oauth_scopes" {
  type    = "list"
  default = [
    "https://www.googleapis.com/auth/cloud-platform",
    "https://www.googleapis.com/auth/logging.write",
    "https://www.googleapis.com/auth/monitoring",
    "https://www.googleapis.com/auth/devstorage.read_write",
    "https://www.googleapis.com/auth/devstorage.full_control",
  ]
}

variable "cluster_version" {
  default = "1.12" # any 1.12 version
}
