resource "kubernetes_deployment" "hello" {
  metadata {
    name = "hello"
    labels {
      app = "hello"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels {
        app = "hello"
      }
    }

    template {
      metadata {
        labels {
          app = "hello"
        }
      }

      spec {
        container {
          image = "gcr.io/google-samples/hello-app:1.0"
          name  = "hello"

          port {
            container_port = 80
          }

          resources{
            limits{
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests{
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "hello" {
  metadata {
    name = "hello"
    annotations {
      "cloud.google.com/load-balancer-type" = "Internal"
    }
  }
  spec {
    selector {
      app = "${kubernetes_deployment.hello.metadata.0.labels.app}"
    }
    port {
      port = 80
      target_port = 8080
    }

    type = "LoadBalancer"
  }
}

output "nginx_ip" {
  value = "${kubernetes_service.hello.load_balancer_ingress.0.ip}"
}
