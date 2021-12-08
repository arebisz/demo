# GENERAL
variable "project_id" {
  type        = string
  description = "GCP project to use"
}
variable "zone" {
  type        = string
  description = "GCP zone to use"
}
variable "bucket_name" {
    type =  string
}
variable "region" {
    type =  string
}
variable "include_monitoring_module" {
    type    = bool
    default = false
}
variable "include_logging_module" {
    type    = bool
    default = false
}
variable "include_patching_module" {
    type    = bool
    default = false
}
variable "include_backup_module" {
    type    = bool
    default = false
}

# INFRA
variable "SNOWPubSubTopicName" {
  type        = string
  description = "Provide name for PubSub Topic that will be created and linked to COS SNOW Cloud Function"
}
variable "ApiCompanyName" {
  type        = string
  description = "Enter the name of Client"
}

variable "SourceBucketPrefix" {
  type        = string
  description = "Enter pre-existing Cloud Storage bucket name containing zipped cloud functions"
}

variable "SnowSecretVersionName" {
  type        = string
  description = "Enter pre-existing Secret Manager secret version name example: projects/PROJECT_ID/secrets/SECRET_NAME/versions/SECRET_VERSION. Used by COS SNOW Cloud Function to authenticate with iPaaS cloud native endpoint"
}

# MONITORING
variable "email_address" {
    type = string 
}
