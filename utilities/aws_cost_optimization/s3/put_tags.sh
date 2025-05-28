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
	resource_id=`echo $FILE | cut -d'/' -f2 | cut -d'.' -f1`
	echo Updating tags for $resource_id from "$FILE"
	aws s3api put-bucket-tagging --bucket $resource_id --tagging file://"$FILE"
done