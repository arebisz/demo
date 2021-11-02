#!/bin/bash

echo "****************************************"
echo "Create storage for Terraform state files"
echo "****************************************"

PROJECT_ID=$(gcloud config get-value project)
bucket_name="${PROJECT_ID}-patching-tfstate"
check_bucket=$(gsutil ls -b gs://$bucket_name)

if [ -z $check_bucket ]; then
    echo "Create the Cloud Storage bucket"
    gsutil mb -p $PROJECT_ID -c standard -l us-east1 --pap enforced gs://$bucket_name
else
    echo "Bucket $bucket_name already exist"
fi

# echo
# echo "Enable Object Versioning to keep the history of your deployments.
# Enabling Object Versioning increases storage costs, 
# which you can mitigate by configuring Object Lifecycle Management to delete old state versions."
# gsutil versioning set on gs://$bucket_name
