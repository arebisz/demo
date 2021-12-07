provider "google" {
    project = var.project
}

resource "google_storage_bucket" "cos_terraform_state" {
name     = var.bucket_name
location = var.region
}

module "monitoring" {
    source = "./monitoring"
    count = var.include_monitoring_module ? 1 : 0
    email_address = var.email_address
    email_display_name = var.email_display_name
}
