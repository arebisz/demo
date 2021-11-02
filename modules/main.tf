locals {
  components           = join(",", var.additional_components)
  gcloud              = local.skip_download ? "gcloud" : "${local.gcloud_bin_path}/gcloud"
  additional_components_command                = "${path.module}/scripts/check_components.sh ${local.gcloud} ${local.components}"
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
  group_labels = [
    {
      env = "prod"
      app = "myproduct"
    }
  ]
  os_types = [
    {
      short_name = "centos"
      version    = "8"
    },
  ]
}
