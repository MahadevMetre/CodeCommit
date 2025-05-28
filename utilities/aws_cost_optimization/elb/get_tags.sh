#!/bin/bash

# Get environment name as first argument : dev,stage,qa,shared,pci,dr
environment=$1

if [[ "${environment}" == "dev" || "${environment}" == "stage" || "${environment}" == "qa" || "${environment}" == "shared" || "${environment}" == "pci" || "${environment}" == "dr" ]]; then
	echo Environment is $environment
else
	echo Invalid value for environment : $environment
	exit 1
fi

# File for saving elb json
input_file=${environment}_elb_info.json
# File for saving elb names
elb_list=${environment}_elb_list.txt
# File for saving ignore list
ignore_list=${environment}_ignore_list.txt
# Directory for json creation
dir_name=${environment}_tag_list

# List the elb properties and use jq tool to get the elb names
aws elbv2 describe-load-balancers > $input_file
cat $input_file | jq -r '.LoadBalancers[].LoadBalancerName' | sort > $elb_list
echo Saved the elb info to $input_file

# Create the ignore list if not exists
touch $ignore_list

# Change from Windows CRLF to Unix like LF line endings (\r\n to \n)
sed -i 's|\r\n|\n|g' $elb_list
sed -i 's|\r\n|\n|g' $ignore_list

# Clean up the existing jsons in output directory
rm -rf $dir_name/*.json
# Make a directory for saving the tag list
mkdir -p $dir_name

# Iterate through the input file and extract the existing tag values
while read -r line
do
	grep -q -w ^$line$ $ignore_list
	if [ "$?" -ne 0 ]; then
		elb_arn=`cat $input_file | jq -r ".LoadBalancers[] | select (.LoadBalancerName == \"$line\") | .LoadBalancerArn"`
		aws elbv2 describe-tags --resource-arns $elb_arn | jq -r '.TagDescriptions[]' > $dir_name/$line.json
		sed -i 's|"ResourceArn"|"ResourceArns"|' $dir_name/$line.json
		echo Tags for the elb $line saved to $dir_name/$line.json
	else
		echo Ignored the elb $line
	fi
done < $elb_list