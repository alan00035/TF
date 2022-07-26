terraform{
    required_providers{
        google={
            version = "~> 4.0.0"
        }
        google-beta={
            versionn ="~> 4.0.0"
        }
    }
}

provider "google" {
  credentials = "PATH/HERE"
  project = "PROJECT_ID"-prod
  region =  "region"
  zone = "zone"
}
provider "google-beta" {
  credentials = "PATH/HERE"
  project = "PROJECT_ID"-dev
  region =  "region"
  zone = "zone"
}
