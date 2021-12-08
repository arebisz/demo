Prerequisites
Create secret in Secret Manager which will be used by COS SNOW Cloud Function to authenticate with iPaaS cloud native endpoint. Provide secret value in this form:

    {
        "client_id" : "PROVIDE HERE CLIENT ID", 
        "client_secret" : "PROVIDE HERE CLIENT SECRET"
    }
Infra module will create cloud function. Script for cloud function should be earlier zipped to existing bucket.

cd infra/scripts/cloud_function_snow_listener/
zip cloud_function_snow_listener.zip cloud_function_snow_listener.py requirements.txt

gsutil cp cloud_function_snow_listener.zip  gs://BUCKET_NAME
Cloud Build
For INFRA module creation Cloud Build service account must have roles:

Cloud Build Service Account
Cloud Functions Admin
Monitoring NotificationChannel Editor
Pub/Sub Admin
Secret Manager Admin
Security Admin
Service Account Admin
Service Account User
Create terraform.zip and upload to existing bucket (Cloud build will get modules from this bucket). Create tar.gz archive with terraform templates:

tar -czvf terraform.tar.gz .
Builds submit
PROJECT_ID=$(gcloud config get-value project)
gcloud builds submit --gcs-source-staging-dir=gs://$PROJECT_ID-cloudbuild-infra/source --config cloudbuild.yaml gs://$PROJECT_ID-cloudbuild-infra/terraform.tar.gz
