variable "project" {
    type =  string 
}
variable "email_address" {
    type = string 
}
variable "email_display_name" {
    type = string 
}

variable "project_num" {
    type = string
}

variable "monitoring" {
    type = bool
    default = false
}

# variable "SnowClientId" {
#     sensitive = true
#     type = string
#     description = "Provide the iPaaS API authentication id. stored in Secret Manager. used by COS-SNOW Lambda to authenticate with iPaaS cloud native endpoint"
# }

# variable "SnowClientSecret" {
#     sensitive = true
#     type = string
#     description = "Provide the iPaaS API authentication secret. stored in Secret Manager. used by COS-SNOW Lambda to authenticate with iPaaS cloud native endpoint"
# }
variable "patching" {
    type = bool
    default = false
}
variable "TagsConditionKey" {
    default = "cos_managed"
    type = string
    description = "Resources with this Tag Key will be managed by COS Monitoring and SSM"
}

variable "TagsConditionValue" {
    default = "yes"
    type = string
    description = "Resources with this Tag Value will be managed by COS Monitoring and SSM"
}

variable "LoggingEnabled" {
    default = true
    type = string
    description = "Specifies if the COS Logging module and resources will be deployed"
    validation {
        condition     = can(regex("^(true|false)$", var.LoggingEnabled))
        error_message = "Must be true or false."
    }
}

variable "MonitoringEnabled" {
    default = true
    type = string
    description = "Specifies if the COS Monitoring module and resources will be deployed"
    validation {
        condition     = can(regex("^(true|false)$", var.MonitoringEnabled))
        error_message = "Must be true or false."
    }
}

variable "BackupEnabled" {
    default = true
    type = string
    description = "Specifies if the COS Backup module and resources will be deployed"
    validation {
        condition     = can(regex("^(true|false)$", var.BackupEnabled))
        error_message = "Must be true or false."
    }
}

variable "PatchingEnabled" {
    default = true
    type = string
    description = "Specifies if the COS Patching module and resources will be deployed"
    validation {
        condition     = can(regex("^(true|false)$", var.PatchingEnabled))
        error_message = "Must be true or false."
    }
}

variable "project_id" {
    type = string
    description = "GCP project to use"
}

variable "zone" {
    type = string
    description = "GCP zone to use"
}

variable "region" {
    type = string
    description = "GCP region to use"
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
