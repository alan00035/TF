resource "google_compute_instance" "this" {
  provider = google
  name ="PROJECT_ID"
  machine_type = "e2-medium"
  zone ="zone"
}

network_interface{
    network ="default"
    access_config {
        # public ID here
    }
}

