provider "google" {
    project = var.project
}

module "monitoring" {
    source = "./monitoring"
    count = var.include_monitoring_module ? 1 : 0
    email_address = var.EMAIL_ADDRESS
    email_display_name = var.email_display_name
}
