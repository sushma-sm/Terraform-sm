terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}
  backend "gcs" {
    bucket  = "my-terraform-bucket-sm1"  
    prefix  = "terraform/state"
  }
}
provider "google" {
    project = var.gcp_project
    region = var.gcp_region
    zone = var.gcp_zone
  
}
resource "google_compute_instance" "vm" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.gcp_zone

  boot_disk {
    initialize_params {
      image = "debian-11"
    }
  }

  network_interface {
    network = "default"
  }
}
