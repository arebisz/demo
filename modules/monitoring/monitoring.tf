resource "google_monitoring_group" "cos_managed" {
    display_name = "cos_managed"
    filter = "metadata.user_labels.cos_managed=yes"
}

resource "google_monitoring_notification_channel" "notification_channel" {
    display_name = var.email_address
    type = "email"
    labels = {
        email_address = var.email_address
    }
}

resource "google_monitoring_alert_policy" "cpu_alert" {
    display_name = "Over 90% CPU Utilization detected over a period of 30 minutes"
    combiner = "OR"
    conditions {
        display_name = "cpu utilization condition"
        condition_monitoring_query_language {
            duration = "1800s"
            query    = <<-EOT
            fetch gce_instance
            | metric 'compute.googleapis.com/instance/cpu/utilization'
            | filter (metadata.user_labels.cos_managed == 'yes')
            | group_by 5m, [value_utilization_mean: mean(value.utilization)]
            | every 5m
            | condition val() > 0.9 '10^2.%'
            EOT
    }
  }
  notification_channels = [ google_monitoring_notification_channel.notification_channel.name ]
}

resource "google_monitoring_alert_policy" "memory_alert" {
    display_name = "Over 90% Memory Utilization detected over a period of 15 minutes"
    combiner = "OR"
    conditions {
        display_name = "cpu utilization condition"
        condition_monitoring_query_language {
            duration = "900s"
            query    = <<-EOT
            fetch gce_instance
            | metric 'agent.googleapis.com/memory/percent_used'
            | filter (metadata.user_labels.cos_managed == 'yes')
            | group_by 5m, [value_percent_used_mean: mean(value.percent_used)]
            | every 5m
            | condition val() > 90 '1'
            EOT
    }
  }
  notification_channels = [ google_monitoring_notification_channel.notification_channel.name ]

}

resource "google_monitoring_alert_policy" "disk_alert" {
        display_name = "Over 90% Disk Utilization detected over a period of 15 minutes"
    combiner = "OR"
    conditions {
        display_name = "cpu utilization condition"
        condition_monitoring_query_language {
            duration = "900s"
            query    = <<-EOT
            fetch gce_instance
            | filter (metadata.user_labels.cos_managed == 'yes')
            | metric 'agent.googleapis.com/disk/percent_used'
            | group_by 5m, [value_percent_used_mean: mean(value.percent_used)]
            | every 5m
            | condition val() > 90 '1'
            EOT
    }
  }
  notification_channels = [ google_monitoring_notification_channel.notification_channel.name ]

}
