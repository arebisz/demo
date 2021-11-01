#!/bin/bash
# Not used at this moment
echo "********************************************************"
echo "Granting permissions to your Cloud Build service account"
echo "********************************************************"
echo
echo "Retrieve the email for your project's Cloud Build service account"
cloudbuild_sa="$(gcloud projects describe $PROJECT_ID \
    --format 'value(projectNumber)')@cloudbuild.gserviceaccount.com"

echo "Check Cloud Build service account permissions"
if [ -z $(gcloud projects get-iam-policy $PROJECT_ID  \
            --flatten="bindings[].members" \
            --format='table(bindings.role)' \
            --filter="bindings.members:$cloudbuild_sa AND bindings.role:roles/editor") ]; then
    echo "Grant the required access to your Cloud Build service account"
    gcloud projects add-iam-policy-binding $PROJECT_ID \
        --member serviceAccount:$cloudbuild_sa --role roles/editor
fi
