# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router
resource "google_compute_router" "casa-router" {
  name    = "casa-router"
  region  = "us-west1"
  network = google_compute_network.main.id
}


