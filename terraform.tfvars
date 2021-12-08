# GENERAL VARIABLES
project_id                = "ccp-lab"
bucket_name               = "cos_gcs_bucket"
region                    = "us-east1"
zone                      = "us-east1-b"
include_monitoring_module = true
include_logging_module    = false
include_patching_module   = false
include_backup_module     = false

# INFRA VARIABLES
ApiCompanyName            = "cos_exmaple_company_name"
SNOWPubSubTopicName       = "COS-SNOW-Monitoring"
SourceBucketPrefix        = "cos-wszumial"
SnowSecretVersionName     = "projects/1027051719498/secrets/ccp-snow-test/versions/2"

# MONITORING VARIABLES
email_address             = "agnieszka.rebisz@capgemini.com"
