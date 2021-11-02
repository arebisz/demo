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
