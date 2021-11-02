echo "***********************"
echo "Reads OS-ShortName and version of cos-managed instances and saves it to variables.tf. Reads instances ID for logging filter and saves it to variables.tf"
echo "***********************"
file_variables="./logging/variables.tf"
file_logging="./logging/logging.tf"
zone=$(awk '/variable "zone" {/{getline; print $NF}' $file_variables | tr -d '"')
project_id=$(awk '/variable "project_id" {/{getline; print $NF}' $file_variables | tr -d '"')
echo $zone
echo $project_id
gcloud services enable compute.googleapis.com
gcloud services enable osconfig.googleapis.com
gcloud services enable cloudresourcemanager.googleapis.com
gcloud services enable logging.googleapis.com
#iam_accounts=($gcloud iam service-accounts list sed -n 's/.*EMAIL: //p')
#for account in $iam_accounts; do
#    if [[ ! "terraform@logging-dla-capa-terraform.iam.gserviceaccount.com" =~ "$account" ]]; then
#    gcloud iam service-accounts create terraform   --description="Service account for VM provisioning with Terraform"   --display-name="terraform"
#    fi
#    done
gcloud projects add-iam-policy-binding $project_id   --member="serviceAccount:terraform@$project_id.iam.gserviceaccount.com"   --role="roles/compute.admin" 
gcloud projects add-iam-policy-binding $project_id   --member="serviceAccount:terraform@$project_id.iam.gserviceaccount.com"   --role="roles/osconfig.guestPolicyAdmin" 
gcloud projects add-iam-policy-binding $project_id   --member="serviceAccount:terraform@$project_id.iam.gserviceaccount.com"   --role="roles/iam.serviceAccountUser"
gcloud projects add-iam-policy-binding $project_id   --member="serviceAccount:terraform@$project_id.iam.gserviceaccount.com"   --role="roles/logging.logWriter"
gcloud projects add-iam-policy-binding $project_id   --member="serviceAccount:terraform@$project_id.iam.gserviceaccount.com"   --role="roles/logging.configWriter"
gcloud projects add-iam-policy-binding $project_id   --member="serviceAccount:terraform@$project_id.iam.gserviceaccount.com"   --role="roles/monitoring.metricWriter"
gcloud projects add-iam-policy-binding $project_id   --member="serviceAccount:terraform@$project_id.iam.gserviceaccount.com"   --role="roles/storage.admin"
gcloud projects add-iam-policy-binding $project_id   --member="serviceAccount:terraform@$project_id.iam.gserviceaccount.com"   --role="roles/iam.securityReviewer"

cos_managed_instances_name=$(gcloud compute instances list --filter='labels.cos-logging-test : dev' --format="value(NAME)")
cos_managed_instances_id=$(gcloud compute instances list --filter='labels.cos-logging-test : dev' --format="value(ID)")


for instance in $cos_managed_instances_name; do
    (gcloud compute instances add-metadata $instance --zone $zone --metadata=enable-guest-attributes=TRUE,enable-osconfig=TRUE)
done
last_instance_id=$(gcloud compute instances list --filter='labels.cos-logging-test : dev' --format="value(ID)"| tail -1)
for instance_id in $cos_managed_instances_id; do
    cos_managed_instances_id_filters+="resource.labels.instance_id = "$instance_id
    if [ "$last_instance_id" != "$instance_id" ]; then
    cos_managed_instances_id_filters+=" OR "
    fi
done
echo "variable \""cos_managed_instances_id"\" {
    default = \""$cos_managed_instances_id_filters"\"
    description = \""cos_managed_instances_id"\"
}
 " >> $file_variables
numberOfPolicy=1
declare -a os 
for instance in $cos_managed_instances_name; do
    os_name=$(gcloud compute instances os-inventory describe $instance --zone $zone | grep 'ShortName' | awk '{print $NF}')
    os_version=$(gcloud compute instances os-inventory describe $instance --zone $zone | grep -w 'Version' | awk '{print $NF}')
    if [[ ! " ${os[*]} " =~ "$os_name $os_version" ]]; then
    os+=("$os_name $os_version")
    echo "
    module \""agent_policy_pmatusza_test_policy_$numberOfPolicy"\" {
        source  = \""terraform-google-modules/cloud-operations/google//modules/agent-policy"\"
        version = \""0.2.1"\"
        project_id = var.project_id
        policy_id  = \""ops-agents-pmatusza-test-policy-$numberOfPolicy"\"
        agent_rules = [
            {
            type               = \""ops-agent"\"
            version            = \""current-major"\"
            package_state      = \""installed"\"
            enable_autoupgrade = true
            },
        ]
        group_labels = [
            var.cos_logging_labels
        ]
        os_types = [
            {
            short_name = \""$os_name"\"
            version    = \""$os_version"\"
            },
        ]
}
        " >> $file_logging
        numberOfPolicy=$(expr $numberOfPolicy + 1)
    fi
    echo "VM:"
    echo $instance 
    echo $os_name 
    echo $os_version 
    echo $zone
done
echo "end"
