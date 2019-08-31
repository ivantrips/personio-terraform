resource "google_container_cluster" "personio_cluster" {
  provider = "google-beta.k8s-project"

  name        = "${var.cluster_name}"
  project     = "${var.k8s_project}"
  location    = "${var.zone}"

  initial_node_count       = 1
  min_master_version       = "${var.cluster_version}"
  remove_default_node_pool = true
}

resource "google_container_node_pool" "server_pool" {
  provider = "google-beta.k8s-project"

  name               = "server-node-pool"
  cluster            = "${google_container_cluster.personio_cluster.name}"
  location           = "${var.zone}"
  initial_node_count = 1
  version            = "${var.cluster_version}"

  node_config {
    machine_type = "n1-standard-1"
    disk_size_gb = "50"
    oauth_scopes = "${var.oauth_scopes}"
    preemptible  = true # i don't want billing to increase

    labels = {
      load = "server"
    }
  }

  timeouts {
    create = "10m"
  }
}
