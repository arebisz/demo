# variable "SnowClientId" {
#     sensitive = true
#     type = string
#     description = "Provide the iPaaS API authentication id."
# }

# variable "SnowClientSecret" {
#     sensitive = true
#     type = string
#     description = "Provide the iPaaS API authentication secret."
# }

variable "TagsConditionKey" {
    default = "cos_managed"
    type = string
    description = "Resources with this Tag Key will be managed by COS."
}

variable "TagsConditionValue" {
    default = "yes"
    type = string
    description = "Resources with this Tag Value will be managed by COS"
}

variable "monitoring_enabled" {
    type = bool
    default = false
}

variable "patching_enabled" {
    type = bool
    default = false
}

variable "project_id" {
    type = string
    description = "Project name"
}

variable "zone" {
    type = string
    description = "Region zone"
}

variable "region" {
    type = string
    description = "Region"
}

variable "cos_patching_labels" {
    type = map
    description = "VM labels to use for patching"
}

variable "instance_name_prefixes" {
    type = string
    description = "Instance name prefix for paching"
}

variable "duration" {
    type = string
    description = "Duration (maintenance window)"
}
variable "rollout_mode" {
    type = string
    description = "Zone rollout"
}

variable "rollout_disruption_budget_percentage" {
    type = number
    description = "Specify the maximum number or percentage of VM instances per zone that may be disrupted by the patch job"
}

variable "recurring_schedule" {
    type = bool
    description = "Enable recurring schedule"
}

variable "recurring_schedule_time_zone_id" {
    type = string
    description = "Timezone"
}

variable "recurring_schedule_time_of_day_hours" {
    type = number
    description = "Start time hour"
}

variable "recurring_schedule_time_of_day_minutes" {
    type = number
    default = 00
    description = "Start time minutes"
}

variable "recurring_schedule_monthly_month_day" {
    type = number
    description = "Start time minutes"
}

variable "one_time_schedule_execute_time" {
    type = string
    description = "Patching execute time"
}
