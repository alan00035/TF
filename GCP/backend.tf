resource "google_cloud_run_service" "default" {
    name = ""
    location = ""
    autogenerate_revision_name = ""
}

template {
    spec{
        containers {
            image =""
        }
    }
}

resource "random_pet" "suffix" {
  length = 2
}