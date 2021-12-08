terraform {
    backend "gcs" {
            bucket = "cos_tfstate"   
            prefix = "terraform_state"           
    }
}
