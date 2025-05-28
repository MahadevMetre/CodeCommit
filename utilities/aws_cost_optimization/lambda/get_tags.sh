#!/bin/bash

# Get environment name as first argument : dev,stage,qa,shared,pci,dr
environment=$1

if [[ "${environment}" == "dev" || "${environment}" == "stage" || "${environment}" == "qa" || "${environment}" == "shared" || "${environment}" == "pci" || "${environment}" == "dr" ]]; then
	echo Environment is $environment
else
	echo Invalid value for environment : $environment
	exit 1
fi

# File for saving lambda arns
lambda_list=${environment}_lambda_list.txt
# Directory for json creation
dir_name=${environment}_tag_list

# List the lambda properties and use jq tool to get the arns
aws lambda list-functions | jq -r '.Functions[].FunctionArn' | sort > $lambda_list
echo Saved the lambda arn info to $lambda_list

# Change from Windows CRLF to Unix like LF line endings (\r\n to \n)
sed -i 's|\r\n|\n|g' $lambda_list

# Clean up already existing output directory
rm -rf $dir_name
# Make a temp directory for preparing file
mkdir -p $dir_name/temp

# Iterate through the input file and extract the existing tag values
while read -r line
do
	lambda_name=`echo $line | awk -F ':' '{print $NF}'`
	echo "{\"Resource\":\"$line\"," > $dir_name/$lambda_name.json
	aws lambda list-tags --resource $line >> $dir_name/$lambda_name.json
	sed -i 'N;s|,\n{|,\n|' $dir_name/$lambda_name.json
	jq . $dir_name/$lambda_name.json > $dir_name/temp/$lambda_name.json
	cat $dir_name/temp/$lambda_name.json > $dir_name/$lambda_name.json
	echo Tags for $lambda_name saved to $dir_name/$lambda_name.json
done < $lambda_list

# Remove the temp directory
rm -rf $dir_name/temp