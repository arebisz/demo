terraform {
    backend "gcs" {
            bucket = "cos_tf_state"   
            prefix = "tfstate"           
    }
}
