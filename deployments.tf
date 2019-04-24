resource "kubernetes_deployment" "eshope" {
  metadata {
    name = "dotnet-example"
    namespace = "example"
    labels {
      test = "eshope-dot-net-app"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels {
        test = "eshope-dot-net-app"
      }
    }

    template {
      metadata {
        labels {
          test = "eshope-dot-net-app"
        }
      }

      spec {
        container {
          image = "diquzart/eshopwebmvc"
          name  = "example"

          env {
            name = "ASPNETCORE_ENVIRONMENT"
            value = "Development"
          }

          resources{
            limits{
              cpu    = "500m"
              memory = "512Mi"
            }
            requests{
              cpu    = "2m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}