provider "google" {
    project = var.project
    email_address = var.EMAIL_ADDRESS
}

resource "google_storage_bucket" "cos_gcs" {
    name     = var.bucket_name
    location = var.region
}

module "monitoring" {
    source = "./modules/monitoring"
    count  = var.include_monitoring_module ? 1 : 0
    email_address = var.email_address
}

module "logging" {
    source = "./modules/logging"
    count  = var.include_logging_module ? 1 : 0
}

module "patching" {
    source = "./modules/patching"
    count  = var.include_patching_module ? 1 : 0
}

module "backup" {
    source = "./modules/backup"
    count  = var.include_backup_module ? 1 : 0
}
