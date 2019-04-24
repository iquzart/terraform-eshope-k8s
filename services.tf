resource "kubernetes_service" "eshope-svc" {
  metadata {
    name = "eshope-svc"
    namespace = "example"
  }
  spec {
    selector {
      test = "eshope-dot-net-app"
    }
    session_affinity = "ClientIP"
    port {
      port = 80
      target_port = 80
    }

    type = "NodePort"
  }
}