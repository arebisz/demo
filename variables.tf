variable "project" {
    type =  string 
}

variable "storage_name" {
    type =  string
}

variable "region" {
    type =  string
}

variable "email_address" {
    type = string 
}

variable "email_display_name" {
    type = string 
}

variable "include_monitoring_module" {
    type = bool
    default = false
}
