provider "google" {
    project = var.project
}

resource "google_storage_bucket" "cos_gcs" {
    name     = var.bucket_name
    location = var.region
}
