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
	sns_arn=`cat "$FILE" | jq -r '.ResourceArn'`
	sns_name=`echo "$sns_arn" | awk -F: '{print $NF}'`
	echo Updating tags for $sns_name from "$FILE"
	aws sns tag-resource --resource-arn $sns_arn --cli-input-json file://"$FILE"
done