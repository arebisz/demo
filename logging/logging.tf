resource "google_storage_bucket" "cos-logging-bucket" {
  name          = "cos-logging-bucket"
  location      = "US"
  retention_policy {
    retention_period = 8035200
  }
}

module "agent_policy" {
  source     = "terraform-google-modules/cloud-operations/google//modules/agent-policy"
  version    = "~> 0.1.0"

  project_id = "<PROJECT ID>"
  policy_id  = "ops-agents-example-policy"
  agent_rules = [
    {
      type               = "ops-agent"
      version            = "current-major"
      package_state      = "installed"
      enable_autoupgrade = true
    },
  ]
}

resource "google_logging_project_sink" "instance-sink" {
  depends_on = [google_storage_bucket.cos-logging-bucket]
  name        = "my-instance-sink"
  description = "some explanation on what this is"
  destination = "storage.googleapis.com/cos-logging-bucket"
  filter      = "resource.type = gce_instance AND $var.cos_managed_instances_id"
  unique_writer_identity = true
}
