#!/bin/bash

# Get environment name as first argument : dev,stage,qa,shared,pci,dr
environment=$1

if [[ "${environment}" == "dev" || "${environment}" == "stage" || "${environment}" == "qa" || "${environment}" == "shared" || "${environment}" == "pci" || "${environment}" == "dr" ]]; then
	echo Environment is $environment
else
	echo Invalid value for environment : $environment
	exit 1
fi

# File where ec2 instance ids are saved
input_file=${environment}_delete_list.txt

while read -r line
do
	instance_id=`echo $line | cut -d';' -f1`
	instance_name=`echo $line | cut -d';' -f2`
	echo Creating AMI of $instance_id
	aws ec2 create-image --description "ami_created_before_deletion" --instance-id "$instance_id" --name "$instance_name" --tag-specifications "ResourceType=image,Tags=[{Key=Name,Value=$instance_name},{Key=Purpose,Value=Created before deleting the instance},{Key=InstanceID,Value=$instance_id}]"
done < $input_file