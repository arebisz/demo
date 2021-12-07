terraform {
    backend "gcs" {
       bucket = "cos-tfstate-bucket"
       prefix = "cos"
    }
}
