terraform {
    backend "gcs" {
            bucket = "cos_terraform_state"   
            prefix = "tfstate"           
    }
}
