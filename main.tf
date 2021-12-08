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

resource "google_storage_bucket" "cos_terraform_state" {
    name     = var.bucket_name
    location = var.region
    force_destroy = true
    versioning {
      enabled = true
    }
}
