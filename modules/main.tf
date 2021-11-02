module "agent_policy" {
  source     = "terraform-google-modules/cloud-operations/google//modules/agent-policy"
  version    = "~> 0.1.0"

  project_id = var.project_id
  policy_id  = "OpsAgent policy
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
      cos_managed = "yes"
    }
  ]
  os_types = [
    {
      short_name = "debian"
      version = "10"
    },
  ]
}
