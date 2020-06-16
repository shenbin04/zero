resource "google_container_cluster" "gke_private" {
  name = "gke-private"
  location = "us-east4"
  remove_default_node_pool = true
  initial_node_count = 1
  master_auth {
    username = ""
    password = ""
    client_certificate_config {
      issue_client_certificate = false
    }
  }
  master_authorized_networks_config {
  }
  private_cluster_config {
    enable_private_endpoint = true
    enable_private_nodes = true
    master_ipv4_cidr_block = "10.10.2.0/28"
  }
  ip_allocation_policy {
    create_subnetwork = true
    use_ip_aliases = true
  }
  addons_config {
    kubernetes_dashboard {
      disabled = false
    }
  }
}

resource "google_container_node_pool" "np-private" {
  name       = "np-private"
  location   = "us-east4"
  cluster    = "${google_container_cluster.gke_private.name}"
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
