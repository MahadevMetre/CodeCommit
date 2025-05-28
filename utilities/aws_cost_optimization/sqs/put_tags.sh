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
	queue_url=`cat "$FILE" | jq -r '.QueueUrl'`
	queue_name=`echo "$queue_url" | awk -F/ '{print $NF}'`
	echo Updating tags for $queue_name from "$FILE"
	aws sqs tag-queue --queue-url $queue_url --cli-input-json file://"$FILE"
done