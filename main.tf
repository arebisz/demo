provider "google" {
    project = var.project_id
}

resource "google_storage_bucket" "cos_gcs" {
    name     = var.bucket_name
    location = var.region
}

module "infra" {
  source                = "./modules/infra"
  project_id            = var.project_id
  region                = var.region
  zone                  = var.zone
  ApiCompanyName        = var.ApiCompanyName
  SNOWPubSubTopicName   = var.SNOWPubSubTopicName
  SourceBucketPrefix    = var.SourceBucketPrefix
  SnowSecretVersionName = var.SnowSecretVersionName
}

module "monitoring" {
    source        = "./modules/monitoring"
    count         = var.include_monitoring_module ? 1 : 0
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
