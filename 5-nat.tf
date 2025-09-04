# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_nat
# nat 1 in us-west
resource "google_compute_router_nat" "casa-nat" {
  name   = "casa-nat"
  router = google_compute_router.casa-router.name
  region = "us-west1"

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  nat_ip_allocate_option             = "MANUAL_ONLY"

  subnetwork {
    name                    = google_compute_subnetwork.casa.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  nat_ips = [google_compute_address.casa-nat.self_link]
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address
resource "google_compute_address" "casa-nat" {
  name         = "casa-nat"
  address_type = "EXTERNAL"
  network_tier = "PREMIUM"
  region       = "us-west1"

}