
resource "google_compute_instance" "win-main-ingredient" {
  name         = "win-main-ingredient"
  machine_type = "e2-medium"
  zone         = "us-west1-a"
  tags         = ["main-ingredient"]

  boot_disk {
    initialize_params {
      image = "windows-cloud/windows-2022"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.casa.name
    access_config {
      // Ephemeral public IP
    }
  }

  #metadata_startup_script = file("./startup.sh") commented out as windows vm's dont use the script
  #I need clarification on this though, so commenting out for now
}



