variable "project_id" {
  type        = string
  description = "GCP project to use"
}

variable "region" {
  type        = string
  description = "GCP region to use"
}

variable "zone" {
  type        = string
  description = "GCP zone to use"
}

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
