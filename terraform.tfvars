#project = "ccplab"
email_address = "agnieszka.rebisz@capgemini.com"
email_display_name = "Agnieszka Rebisz"
#project_num = "1027051719498"
monitoring_enabled = true
patching_enabled = true

# GENERAL VARIABLES
#project_id = "ccp-lab"
region = "us-east1"
zone = "us-east1-b"

# PATCHING VARIABLES
cos_patching_labels = {
    cos-patching-test = "dev",
    owner = "test_owner"
}

instance_name_prefixes = "cos-masereda-"                    # Remove variable if will not be required
duration = "600s"
rollout_mode = "ZONE_BY_ZONE"
rollout_disruption_budget_percentage = 25
recurring_schedule = true
recurring_schedule_time_zone_id = "Europe/Warsaw"           # Use in case of recurring_schedule = true
recurring_schedule_time_of_day_hours = 10                   # Use in case of recurring_schedule = true
recurring_schedule_time_of_day_minutes = 30                 # Use in case of recurring_schedule = true
recurring_schedule_monthly_month_day = -1                   # Use in case of recurring_schedule = true. -1 indicates the last day of the month
one_time_schedule_execute_time = "2021-10-25T14:00:00Z"     # Use in case of recurring_schedule = false
