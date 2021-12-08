terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
    project = var.project
}

resource "google_storage_bucket" "cos_gcs" {
    name     = var.bucket_name
    location = var.region
}

module "monitoring" {
    source = "./monitoring"
    count  = var.include_monitoring_module ? 1 : 0
}
