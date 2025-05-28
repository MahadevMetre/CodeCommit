#!/bin/bash

# Get environment name as first argument : dev,stage,qa,shared,pci,dr
environment=$1

if [[ "${environment}" == "dev" || "${environment}" == "stage" || "${environment}" == "qa" || "${environment}" == "shared" || "${environment}" == "pci" || "${environment}" == "dr" ]]; then
	echo Environment is $environment
else
	echo Invalid value for environment : $environment
	exit 1
fi

# Directory where jsons files are saved
dir_name=${environment}_tag_list

# Iterate through the directory and push the tags from the tag list
for FILE in ${dir_name}/*.json
do
	elb_arn=`cat "$FILE" | jq -r '.ResourceArns'`
	elb_name=`echo "$FILE" | cut -d"/" -f2 | cut -d"." -f1`
	echo Updating tags for $elb_name from "$FILE"
	aws elbv2 add-tags --resource-arns $elb_arn --cli-input-json file://"$FILE"
done