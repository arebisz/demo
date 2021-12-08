terraform {
    backend "gcs" {
            bucket = "cos-tfstate"   
            prefix = "terraform_state"           
    }
}
