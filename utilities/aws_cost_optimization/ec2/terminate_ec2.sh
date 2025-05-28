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

sleep 30

while read -r line
do
	instance_id=`echo $line | cut -d';' -f1`
	echo Terminating the instance $instance_id
	aws ec2 terminate-instances --instance-ids $instance_id
done < $input_file