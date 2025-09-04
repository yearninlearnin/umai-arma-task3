

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_url_map
# Resource: Global URL Map
resource "google_compute_region_url_map" "lb-url-map" {
  name            = "lb-url-map"
  default_service = google_compute_region_backend_service.distro.self_link
  region = "us-west1"
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_target_http_proxy
# Resource: Global HTTP Proxy
resource "google_compute_region_target_http_proxy" "lb-http-proxy" {
  name    = "lb-http-proxy"
  url_map = google_compute_region_url_map.lb-url-map.self_link
  region  = "us-west1"
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_forwarding_rule
# Resource: Global Forwarding Rule
resource "google_compute_forwarding_rule" "lb-forwarding-rule" {
  name        = "lb-forwarding-rule"
  target      = google_compute_region_target_http_proxy.lb-http-proxy.self_link
  port_range  = "80"
  ip_protocol = "TCP"
  region      = "us-west1"
  #ip_address            = google_compute_global_address.lb.address
  load_balancing_scheme = "INTERNAL_MANAGED" # Current Gen LB (not classic)
  network               = google_compute_network.main.id
  subnetwork            = google_compute_subnetwork.casa.id


  # During the destroy process, we need to ensure LB is deleted first, before proxy-only subnet
  depends_on = [
    google_compute_subnetwork.casa,
    google_compute_subnetwork.proxy_subnet,
    google_compute_region_backend_service.distro
  ]


}


# # https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address
# #Resource: Reserve Global Static IP Address
# resource "google_compute_global_address" "lb" {
#   name = "lb-static-ip"
#   region = "us-west1"
# }

