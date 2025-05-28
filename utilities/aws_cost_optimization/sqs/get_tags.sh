#!/bin/bash

# Get environment name as first argument : dev,stage,qa,shared,pci,dr
environment=$1

if [[ "${environment}" == "dev" || "${environment}" == "stage" || "${environment}" == "qa" || "${environment}" == "shared" || "${environment}" == "pci" || "${environment}" == "dr" ]]; then
	echo Environment is $environment
else
	echo Invalid value for environment : $environment
	exit 1
fi

# File for saving sqs json
input_file=${environment}_sqs_info.json
# File for saving sqs names
sqs_list=${environment}_sqs_list.txt
# File for saving ignore list
ignore_list=${environment}_ignore_list.txt
# Directory for json creation
dir_name=${environment}_tag_list

# List the sqs properties and use jq tool to get the sqs names
aws sqs list-queues > $input_file
cat $input_file | jq -r '.QueueUrls[]' > $sqs_list
echo Saved the sqs info to $input_file

# Create the ignore list if not exists
touch $ignore_list

# Change from Windows CRLF to Unix like LF line endings (\r\n to \n)
sed -i 's|\r\n|\n|g' $sqs_list
sed -i 's|\r\n|\n|g' $ignore_list

# Clean up the existing jsons in output directory
rm -rf $dir_name/*.json
# Make a temp directory for preparing file
mkdir -p $dir_name/temp

# Iterate through the input file and extract the existing tag values
while read -r line
do
	grep -q -w ^$line$ $ignore_list
	if [ "$?" -ne 0 ]; then
		queue_name=`echo "$line" | awk -F/ '{print $NF}'`
		echo "{\"QueueUrl\":\"$line\",\"Tags\":" > $dir_name/$queue_name.json
		aws sqs list-queue-tags --queue-url $line | jq -r '.Tags' >> $dir_name/$queue_name.json
		echo "}" >> $dir_name/$queue_name.json
		jq . $dir_name/$queue_name.json > $dir_name/temp/$queue_name.json
		cat $dir_name/temp/$queue_name.json > $dir_name/$queue_name.json
		echo Tags for the sqs queue $queue_name saved to $dir_name/$queue_name.json
	else
		echo Ignored the sqs queue $line
	fi
done < $sqs_list

# Remove the temp directory
rm -rf $dir_name/temp

echo -e "\nSQS queue jsons saved under $dir_name directory\n"