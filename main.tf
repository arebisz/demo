terraform {
    required_providers {
        google = {
            source = "hashicorp/google"
        }
    }
}

provider "google" {
    project = var.project_id
    region  = var.region
    zone    = var.zone
}

module "monitoring" {
    count = var.monitoring_enabled ? 1 : 0
    source = "./monitoring"
    email_address = var.email_address
    email_display_name = var.email_display_name
}
    
module "patching" {
    count = var.patching_enabled ? 1 : 0
    source = "./patching"
}
    
#module "logging" {
#    source = "./logging"
#}
