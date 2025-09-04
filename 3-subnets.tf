#This is the subnet for the windows machine
resource "google_compute_subnetwork" "casa" {
  name                     = "casa"
  ip_cidr_range            = "10.78.10.0/24"
  region                   = "us-west1"
  network                  = google_compute_network.main.id
  private_ip_google_access = true
}


#Regional Proxy-Only Subnet 
#Required for Regional Application Load Balancer for traffic offloading

resource "google_compute_subnetwork" "proxy_subnet" {
  name          = "proxy-subnet"
  region        = "us-west1"
  ip_cidr_range = "192.168.255.0/24"
  # This purpose reserves this subnet for regional Envoy-based load balancers
  #purpose       = "REGIONAL_MANAGED_PROXY"
  purpose = "INTERNAL_HTTPS_LOAD_BALANCER"
  network = google_compute_network.main.id
  role    = "ACTIVE"
}
