variable "additional_components" {
  description = "Additional gcloud CLI components to install. Defaults to none. Valid value are components listed in `gcloud components list`"
  default     = []
}

variable "enabled" {
  description = "Flag to optionally disable usage of this module."
  type        = bool
  default     = true
}

variable "skip_download" {
  description = "Whether to skip downloading gcloud (assumes gcloud is already available outside the module)"
  type        = bool
  default     = true
}
