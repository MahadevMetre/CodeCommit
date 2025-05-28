#!/bin/bash

# Get environment name as first argument : dev,stage,qa,shared,pci,dr
environment=$1

if [[ "${environment}" == "dev" || "${environment}" == "stage" || "${environment}" == "qa" || "${environment}" == "shared" || "${environment}" == "pci" || "${environment}" == "dr" ]]; then
	echo Environment is $environment
else
	echo Invalid value for environment : $environment
	exit 1
fi

if [[ "${environment}" == "dev" ]]; then
	account_id=116762271881
elif [[ "${environment}" == "qa" ]]; then
	account_id=634621569833
elif [[ "${environment}" == "stage" ]]; then
	account_id=702230634984
elif [[ "${environment}" == "shared" ]]; then
	account_id=964190570136
elif [[ "${environment}" == "dr" ]]; then
	account_id=214946096060
elif [[ "${environment}" == "pci" ]]; then
	account_id=601751840347
fi

# File for saving ses json
input_file=${environment}_ses_info.json
# File for saving ses identities
ses_list=${environment}_ses_list.txt
# File for saving ignore list
ignore_list=${environment}_ignore_list.txt
# Directory for json creation
dir_name=${environment}_tag_list

# List the ses properties and use jq tool to get the ses identities
aws sesv2 list-email-identities > $input_file
cat $input_file | jq -r '.EmailIdentities[].IdentityName' > $ses_list
echo Saved the ses info to $input_file

# Create the ignore list if not exists
touch $ignore_list

# Change from Windows CRLF to Unix like LF line endings (\r\n to \n)
sed -i 's|\r\n|\n|g' $ses_list
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
		ses_arn="arn:aws:ses:us-east-1:$account_id:identity/$line"
		aws sesv2 list-tags-for-resource --resource-arn $ses_arn >> $dir_name/$line.json
		sed -i "2 i \"ResourceArn\":\"$ses_arn\"," $dir_name/$line.json
		jq . $dir_name/$line.json > $dir_name/temp/$line.json
		cat $dir_name/temp/$line.json > $dir_name/$line.json
		echo Tags for the ses identity $line saved to $dir_name/$line.json
	else
		echo Ignored the ses identity $line
	fi
done < $ses_list

# Remove the temp directory
rm -rf $dir_name/temp

echo -e "\nses identity jsons saved under $dir_name directory\n"