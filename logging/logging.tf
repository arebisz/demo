resource "google_storage_bucket" "cos-logging-bucket" {
  name          = "cos-logging-bucket"
  location      = "US"
  retention_policy {
    retention_period = 8035200
  }
}

resource "google_logging_project_sink" "instance-sink" {
  depends_on = [google_storage_bucket.cos-logging-bucket]
  name        = "my-instance-sink"
  description = "some explanation on what this is"
  destination = "storage.googleapis.com/cos-logging-bucket"
  filter      = "resource.type = gce_instance AND $var.cos_managed_instances_id"
  unique_writer_identity = true
}
