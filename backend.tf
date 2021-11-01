terraform {
    backend "gcs" {
            bucket = "PROJECT_ID_terraform"
            prefix = "monit_state"
    }
}
