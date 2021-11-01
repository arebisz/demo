variable "project_id" {
    default = "ccp-lab"
    description = "GCP project to use"
}

variable "region" {
    default = "us-east1"
    description = "GCP region to use"
}

variable "zone" {
    default = "us-east1-b"
    description = "GCP zone to use"
}
variable "cos_logging_labels" {
  type = map
  default = {
    "cos-logging-test" = "dev"
  }
  description = "VM labels to use for logging"
}
