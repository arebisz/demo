# GENERAL VARIABLES
project_id = "ccp-lab"
region = "us-east1"
zone = "us-east1-b"
monitoring_enabled = true
patching_enabled = true

# PATCHING VARIABLES
instance_name_prefixes = "cos-arebisz-"                    # Remove variable if will not be required
duration = "600s"
rollout_mode = "ZONE_BY_ZONE"
rollout_disruption_budget_percentage = 25
recurring_schedule = false
recurring_schedule_time_zone_id = "Europe/Warsaw"           # Use in case of recurring_schedule = true
recurring_schedule_time_of_day_hours = 10                   # Use in case of recurring_schedule = true
recurring_schedule_time_of_day_minutes = 30                 # Use in case of recurring_schedule = true
recurring_schedule_monthly_month_day = -1                   # Use in case of recurring_schedule = true. -1 indicates the last day of the month
one_time_schedule_execute_time = "2021-11-02T06:30:00:00Z"     # Use in case of recurring_schedule = false

# MONITORING VARIABLES
email_address = "agnieszka.rebisz@capgemini.com"
email_display_name = "Agnieszka Rebisz"
