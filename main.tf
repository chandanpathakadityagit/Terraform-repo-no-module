provider "google" {
  credentials = file("/root/terraform-key.json")
  project     = "prj-5-417003"
  region      = "us-central1" # Set your desired region
}


resource "google_compute_instance" "web" {
  name                      = "web"
  machine_type              = "e2-micro"
  zone                      = "us-central1-a"
  allow_stopping_for_update = "true"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}

resource "google_compute_instance" "app" {
  name                      = "app"
  machine_type              = "e2-micro"
  zone                      = "us-central1-b"
  allow_stopping_for_update = "true"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}
