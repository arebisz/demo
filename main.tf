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
    source = "./monitoring"
    count = var.include_monitoring_module ? 1 : 0
    email_address = var.email_address
    email_display_name = var.email_display_name
}
