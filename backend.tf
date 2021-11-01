terraform {
    backend "gcs" {
            bucket = "PROJECT_NUM_terraform_setup"
            prefix = "terraform_state"
    }
}
