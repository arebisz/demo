terraform {
    backend "gcs" {
            bucket = var.bucket_name   
            prefix = "terraform_state"           
    }
}
