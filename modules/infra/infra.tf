data "google_project" "project" {
}

resource "google_pubsub_topic" "pubsub_snow_topic" {
  name = var.SNOWPubSubTopicName
}


resource "google_service_account" "snow_function_service_account" {
  account_id   = "cos-snow-service-account"
  display_name = "COS SNOW Service Account"
}

resource "google_cloudfunctions_function" "cloud_function_snow_listener" {
  name                  = "COS-SNOW-Listener-${var.region}"
  description           = "COS Cloud Function that will connect to iPaaS API endpoint via secret manager API key and pass alert payloads to CCP MSP ServiceNow"
  runtime               = "python39"
  timeout               = 300
  source_archive_bucket = "${var.SourceBucketPrefix}-source-${var.region}"
  source_archive_object = "cloud_function_snow_listener.zip"
  entry_point           = "main"
  event_trigger {
    event_type = "google.pubsub.topic.publish"
    resource   = google_pubsub_topic.pubsub_snow_topic.id
  }
  service_account_email = google_service_account.snow_function_service_account.email
  environment_variables = {
    company_name = var.ApiCompanyName
    ccp_snow     = var.SnowSecretVersionName
  }
}

resource "google_secret_manager_secret_iam_binding" "binding" {
  secret_id = var.SnowSecretVersionName
  role      = "roles/secretmanager.secretAccessor"
  members = [
    "serviceAccount:${google_service_account.snow_function_service_account.email}",
  ]
}

resource "google_pubsub_topic_iam_binding" "binding" {
  topic = google_pubsub_topic.pubsub_snow_topic.name
  role  = "roles/pubsub.publisher"
  members = [
    "serviceAccount:service-${data.google_project.project.number}@gcp-sa-monitoring-notification.iam.gserviceaccount.com"
  ]
}

resource "google_monitoring_notification_channel" "pubsub_snow_topic" {
  display_name = "COS-SNOW-Monitoring"
  type         = "pubsub"
  labels = {
    "topic" = google_pubsub_topic.pubsub_snow_topic.id
  }
}
