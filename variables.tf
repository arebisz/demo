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

variable "email_address" {
    type = string 
}

variable "email_display_name" {
    type = string 
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
