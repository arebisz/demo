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
    count = var.monitoring ? 1 : 0
    source = "./monitoring"
    email_address = var.email_address
    email_display_name = var.email_display_name
}
    
module "patching" {
    count = var.patching ? 1 : 0
    source = "./patching"
    project_id = var.project_id
    zone = var.zone
    region = var.region
    cos_patching_labels = var.cos_patching_labels
    instance_name_prefixes = var.instance_name_prefixes
    duration = var.duration
    rollout_mode = var.rollout_mode
    rollout_disruption_budget_percentage = var.rollout_disruption_budget_percentage
    recurring_schedule = var.recurring_schedule
    recurring_schedule_time_zone_id = var.recurring_schedule_time_zone_id
    recurring_schedule_time_of_day_hours = var.recurring_schedule_time_of_day_hours
    recurring_schedule_time_of_day_minutes = var.recurring_schedule_time_of_day_minutes
    recurring_schedule_monthly_month_day = var.recurring_schedule_monthly_month_day
    one_time_schedule_execute_time = var.one_time_schedule_execute_time
}
    
#module "logging" {
#    source = "./logging"
#}
