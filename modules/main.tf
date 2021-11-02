locals {
  cache_path           = local.skip_download ? "" : "${path.module}/cache/${random_id.cache[0].hex}"
  gcloud_bin_path      = "${local.cache_path}/google-cloud-sdk/bin"
  components           = join(",", var.additional_components)
  gcloud              = local.skip_download ? "gcloud" : "${local.gcloud_bin_path}/gcloud"
  additional_components_command                = "${path.module}/scripts/check_components.sh ${local.gcloud} ${local.components}"
  download_override = var.enabled ? data.external.env_override[0].result.download : ""
  skip_download     = local.download_override == "always" ? false : (local.download_override == "never" ? true : var.skip_download)
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
  
data "external" "env_override" {
  count = var.enabled ? 1 : 0

  program = ["${path.module}/scripts/check_env.sh"]
  query   = {}
}
