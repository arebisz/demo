provider "google" {
    project = var.project
}

module "monitoring" {
    source = "./monitoring"
    count = var.include_monitoring_module ? 1 : 0
}
