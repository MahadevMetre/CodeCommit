#!/bin/bash

# Get environment name as first argument : dev,stage,qa,shared,pci,dr
environment=$1

if [[ "${environment}" == "dev" || "${environment}" == "stage" || "${environment}" == "qa" || "${environment}" == "shared" || "${environment}" == "pci" || "${environment}" == "dr" ]]; then
	echo Environment is $environment
else
	echo Invalid value for environment : $environment
	exit 1
fi

# File for saving sns json
input_file=${environment}_sns_info.json
# File for saving sns names
sns_list=${environment}_sns_list.txt
# File for saving ignore list
ignore_list=${environment}_ignore_list.txt
# Directory for json creation
dir_name=${environment}_tag_list

# List the sns properties and use jq tool to get the sns names
aws sns list-topics > $input_file
cat $input_file | jq -r '.Topics[].TopicArn' > $sns_list
echo Saved the sns info to $input_file

# Create the ignore list if not exists
touch $ignore_list

# Change from Windows CRLF to Unix like LF line endings (\r\n to \n)
sed -i 's|\r\n|\n|g' $sns_list
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
		sns_name=`echo "$line" | awk -F: '{print $NF}'`
		aws sns list-tags-for-resource --resource-arn $line >> $dir_name/$sns_name.json
		sed -i "2 i \"ResourceArn\":\"$line\"," $dir_name/$sns_name.json
		jq . $dir_name/$sns_name.json > $dir_name/temp/$sns_name.json
		cat $dir_name/temp/$sns_name.json > $dir_name/$sns_name.json
		echo Tags for the sns topic $sns_name saved to $dir_name/$sns_name.json
	else
		echo Ignored the sns topic $line
	fi
done < $sns_list

# Remove the temp directory
rm -rf $dir_name/temp

echo -e "\nSNS topic jsons saved under $dir_name directory\n"