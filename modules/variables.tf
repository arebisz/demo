variable "additional_components" {
  description = "Additional gcloud CLI components to install. Defaults to none. Valid value are components listed in `gcloud components list`"
  default     = []
}
