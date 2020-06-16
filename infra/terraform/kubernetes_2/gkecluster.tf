resource "google_container_cluster" "cluster" {
  name                     = "cluster"
  location                 = "us-central1"
  remove_default_node_pool = true
  initial_node_count       = 1
  master_auth {
    username = ""
    password = ""
      client_certificate_config {
      issue_client_certificate = false
    }
  }
  addons_config {
    kubernetes_dashboard {
      disabled = false
    }
  }
}

resource "google_container_node_pool" "node-pool" {
  name       = "node-pool"
  location   = "us-central1"
  cluster    = "${google_container_cluster.cluster.name}"
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "n1-standard-1"

    metadata {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
