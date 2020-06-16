resource "kubernetes_deployment" "hello" {
  metadata {
    name = "hello"
    labels {
      test = "Hello"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels {
        test = "Hello"
      }
    }

    template {
      metadata {
        labels {
          test = "Hello"
        }
      }

      spec {
        container {
          image = "nginx:1.7.8"
          name  = "hello"

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
