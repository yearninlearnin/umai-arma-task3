# https://www.terraform.io/language/settings/backends/gcs
terraform {
  backend "gcs" {
    bucket      = "shumatsu-v1"
    prefix      = "terraform/state"
    credentials = "gcpkey.json"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.0.0"
    }
  }
}


