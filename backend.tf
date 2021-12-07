terraform {
    backend "gcs" {
        bucket = "ccp-lab-tfstate"
        prefix = "terraform/state"
    }
}
