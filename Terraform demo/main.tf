resource "google_compute_instance" "TransformerMariaDB" {
  project      = var.project
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  metadata = {
    startup-script-url = "https://primes-academy-bucket.s3.us-east-1.amazonaws.com/bash_setup_mariadb_bootstrappable_v4_with_debugger.sh"
  }

  tags = ["mariadb", "transformers", "test-environment"] # Tags for identifying the instance
}