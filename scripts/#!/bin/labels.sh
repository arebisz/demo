#!/bin/bash
# Not used at this moment
echo "***********************"
echo "Add labels to instances"
echo "***********************"
#add zone
cos_managed_instances=$(gcloud compute instances list --filter='labels.cos_managed:yes' --format="value(NAME)")
for instance in $cos_managed_instances; do
    os_name=$(gcloud compute instances os-inventory describe $instance | grep 'ShortName')
    if $os_name != "windows"; do
        $os_name="linux"
    done
    gcloud compute instances add-labels $instance --labels=os_system=$os_name
done
