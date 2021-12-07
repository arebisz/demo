terraform {
    backend "gcs" {
            bucket = "COS_terraform_backend"
            prefix = "terraform_state"
    }
}
