#!/bin/bash

# Get environment name as first argument : dev,stage,qa,shared,pci,dr
environment=$1

if [[ "${environment}" == "dev" || "${environment}" == "stage" || "${environment}" == "qa" || "${environment}" == "shared" || "${environment}" == "pci" || "${environment}" == "dr" ]]; then
	echo Environment is $environment
else
	echo Invalid value for environment : $environment
	exit 1
fi

# File for saving s3 bucket list
s3_bucket_list=${environment}_bucket_list.txt
# File for saving ignore list
ignore_list=${environment}_ignore_list.txt
# Directory for json creation
dir_name=${environment}_tag_list

# List the s3 buckets and saves to file
aws s3 ls | awk '{print $NF}' | sort > $s3_bucket_list
echo Saved the bucket list to $s3_bucket_list

# Create the ignore list if not exists
touch $ignore_list

# Change from Windows CRLF to Unix like LF line endings (\r\n to \n)
sed -i 's|\r\n|\n|g' $s3_bucket_list
sed -i 's|\r\n|\n|g' $ignore_list

# Clean up the existing jsons in output directory
rm -rf $dir_name/*.json
# Make a directory for saving the tag list
mkdir -p $dir_name

# Iterate through the bucket list and get the existing tag values
while read -r line
do
	grep -q -w ^$line$ $ignore_list
	if [ "$?" -ne 0 ]; then
		aws s3api get-bucket-tagging --bucket $line > $dir_name/$line.json 2>&1
		echo Tags for the bucket $line saved to $dir_name/$line.json
	else
		echo Ignored the bucket $line
	fi
done < $s3_bucket_list