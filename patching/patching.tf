resource "google_os_config_patch_deployment" "recurring_patching" {
    # Start resource if recurring_schedule = true
    count = var.recurring_schedule ? 1 : 0
    patch_deployment_id = "cos-patching"
    instance_filter {
        instance_name_prefixes = ["${var.instance_name_prefixes}"]
        zones = ["${var.zone}"]
    }

    patch_config {
        reboot_config = "NEVER"

        # apt {
        #     type = "DIST"
        #     #excludes = ["python"]
        # }

        yum {
            security = true
            minimal = true
            #excludes = ["bash"]
        }

        # goo {
        #     enabled = true
        # }

        # zypper {
        #     categories = ["security"]
        # }

        windows_update {
            classifications = ["CRITICAL", "SECURITY", "UPDATE"]
        }

        # pre_step {
        #   linux_exec_step_config {
        #     allowed_success_codes = [0,3]
        #     local_path = "/tmp/pre_patch_script.sh"
        #   }

        #   windows_exec_step_config {
        #     interpreter = "SHELL"
        #     allowed_success_codes = [0,2]
        #     local_path  = "C:\\Users\\user\\pre-patch-script.cmd"
        #   }
        # }

        # post_step {
        #   linux_exec_step_config {
        #     gcs_object {
        #       bucket = "my-patch-scripts"
        #       generation_number = "1523477886880" 
        #       object = "linux/post_patch_script"
        #     }
        #   }

        #   windows_exec_step_config {
        #     interpreter = "POWERSHELL"
        #     gcs_object {
        #       bucket = "my-patch-scripts"
        #       generation_number = "135920493447"
        #       object = "windows/post_patch_script.ps1"
        #     }
        #   }
        # }
    }

    duration = var.duration

    recurring_schedule {
        time_zone {
            id = var.recurring_schedule_time_zone_id
        }
        time_of_day {
            hours = var.recurring_schedule_time_of_day_hours
            minutes = var.recurring_schedule_time_of_day_minutes
        }
        monthly {
            month_day = var.recurring_schedule_monthly_month_day
        }
    }

    rollout {
        mode = var.rollout_mode
        disruption_budget {
            percentage = var.rollout_disruption_budget_percentage
        }
    }
}

resource "google_os_config_patch_deployment" "one_time_patching" {
    # Start resource if recurring_schedule = false
    count = var.recurring_schedule ? 0 : 1
    patch_deployment_id = "cos-patching"
    instance_filter {
        instance_name_prefixes = ["${var.instance_name_prefixes}"]
        zones = ["${var.zone}"]
    }

    patch_config {
        reboot_config = "NEVER"

        # apt {
        #     type = "DIST"
        #     #excludes = ["python"]
        # }

        yum {
            security = true
            minimal = true
            #excludes = ["bash"]
        }

        # goo {
        #     enabled = true
        # }

        # zypper {
        #     categories = ["security"]
        # }

        windows_update {
            classifications = ["CRITICAL", "SECURITY", "UPDATE"]
        }

        # pre_step {
        #   linux_exec_step_config {
        #     allowed_success_codes = [0,3]
        #     local_path = "/tmp/pre_patch_script.sh"
        #   }

        #   windows_exec_step_config {
        #     interpreter = "SHELL"
        #     allowed_success_codes = [0,2]
        #     local_path  = "C:\\Users\\user\\pre-patch-script.cmd"
        #   }
        # }

        # post_step {
        #   linux_exec_step_config {
        #     gcs_object {
        #       bucket = "my-patch-scripts"
        #       generation_number = "1523477886880" 
        #       object = "linux/post_patch_script"
        #     }
        #   }

        #   windows_exec_step_config {
        #     interpreter = "POWERSHELL"
        #     gcs_object {
        #       bucket = "my-patch-scripts"
        #       generation_number = "135920493447"
        #       object = "windows/post_patch_script.ps1"
        #     }
        #   }
        # }
    }

    duration = var.duration

    one_time_schedule {
        execute_time = var.one_time_schedule_execute_time
    }

    rollout {
        mode = var.rollout_mode
        disruption_budget {
            percentage = var.rollout_disruption_budget_percentage
        }
    }
}
