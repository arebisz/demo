variable "project" {
    type =  string 
}

variable "bucket_name" {
    type =  string
}

variable "region" {
    type =  string
}

variable "EMAIL_ADDRESS" {
    type = string 
}

variable "include_monitoring_module" {
    type = bool
    default = false
}

variable "include_logging_module" {
    type = bool
    default = false
}

variable "include_patching_module" {
    type = bool
    default = false
}

variable "include_backup_module" {
    type = bool
    default = false
}
