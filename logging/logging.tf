resource "google_storage_bucket" "storage-bucket-for-logs-ccp-pmatusza" {
  name          = "storage-bucket-for-logs-ccp-pmatusza1"
  location      = "US"
  retention_policy {
    retention_period = 8035200
  }
}

resource "google_logging_project_sink" "instance-sink" {
  depends_on = [google_storage_bucket.storage-bucket-for-logs-ccp-pmatusza]
  name        = "my-instance-sink"
  description = "some explanation on what this is"
  destination = "storage.googleapis.com/storage-bucket-for-logs"
  filter      = "resource.type = gce_instance AND $var.cos_managed_instances_id"
}
