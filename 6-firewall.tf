
# rdp for windows
resource "google_compute_firewall" "rdp" {
  name    = "rdp"
  network = google_compute_network.main.name

  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["main-ingredient"]
}


# Allow HTTP Traffic
resource "google_compute_firewall" "allow-http" {
  name    = "allow-http"
  network = google_compute_network.main.name

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  # source_ranges = ["0.0.0.0/0"]
  target_tags = ["ad-bailey"]
  source_tags = ["main-ingredient"]
}



# We might not need SSH for this project
# Allow ssh
resource "google_compute_firewall" "allow-ssh" {
  name    = "allow-ssh"
  network = google_compute_network.main.name
  #direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}




# we dont need ping for this project

# resource "google_compute_firewall" "icmp" {
#   name    = "icmp"
#   network = google_compute_network.main.name

#   allow {
#     protocol = "icmp"
#   }
#   source_ranges = ["0.0.0.0/0"]
# }




# resource "google_compute_firewall" "allow-db" {
#   name    = "allow-db"
#   network = google_compute_network.main.name

#   allow {
#     protocol = "tcp"
#     ports    = ["3306", "1521"]
#   }


