terraform {
    backend "gcs" {
            bucket = "PROJECT_ID_terraform_setup"
            prefix = "terraform_state"
    }
}
