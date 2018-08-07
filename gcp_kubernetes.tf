resource "google_container_cluster" "kubey" {
  name = "kubeycluster"
  zone = "europe-west2-a"

  initial_node_count = "1"

  additional_zones = [
    "europe-west2-b",
  ]

  master_auth {
    username = "${var.gcp_kube_username}"
    password = "${var.gcp_kube_password}"
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels {
      this-is-for = "dev-cluster"
    }

    tags = ["dev", "work"]
  }
}

variable gcp_kube_username {}
variable gcp_kube_password {}
