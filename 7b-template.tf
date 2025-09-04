# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_instance_template
# https://developer.hashicorp.com/terraform/language/functions/file
# Google Compute Engine: Regional Instance Template

# #This is for the Linux vm
# dibeann is debian, inside joke because Don Pozet pronounces it like di-bean
resource "google_compute_region_instance_template" "dibeann-template" {
  name         = "dibeann"
  region       = "us-west1"
  description  = "Do all of the linux - het_tanis"
  machine_type = "e2-medium"
    lifecycle {
    create_before_destroy = true
  }


  tags = ["ad-bailey"]

  # Create a new disk from an image and set as boot disk
  disk {
    source_image = "debian-cloud/debian-12"
    boot         = true
    auto_delete  = true
    disk_size_gb = 40
  }


  # Network Configurations 
  network_interface {
    subnetwork = google_compute_subnetwork.casa.id
    network    = google_compute_network.main.id
    /*
    access_config {
      # Include this section to give the VM an external IP address
    } 
    */
  }

  # Install Webserver using file() function
  metadata_startup_script = file("./startup.sh")
}