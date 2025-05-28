#!/bin/bash

# Get environment name as first argument : dev,stage,qa,shared,pci,dr
environment=$1

if [[ "${environment}" == "dev" || "${environment}" == "stage" || "${environment}" == "qa" || "${environment}" == "shared" || "${environment}" == "pci" || "${environment}" == "dr" ]]; then
	echo Environment is $environment
else
	echo Invalid value for environment : $environment
	exit 1
fi

# File for saving ebs json
input_file=${environment}_ebs_info.json
# File for saving volume ids
ec2_ebs_list=${environment}_ebs_list.txt
# File for saving ignore list
ignore_list=${environment}_ignore_list.txt
# Directory for json creation
dir_name=${environment}_tag_list

# List the ec2 volume properties and use jq tool to get the volume ids
aws ec2 describe-volumes > $input_file
cat $input_file | jq -r '.Volumes[].VolumeId' > $ec2_ebs_list
echo Saved the ebs info to $input_file

# Create the ignore list if not exists
touch $ignore_list

# Change from Windows CRLF to Unix like LF line endings (\r\n to \n)
sed -i 's|\r\n|\n|g' $ec2_ebs_list
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
		echo "{\"DryRun\":false,\"Resources\":[\"$line\"],\"Tags\":[" > $dir_name/$line.json
		cat $input_file | jq -r ".Volumes[] | select (.VolumeId == \"$line\") | select(.Tags != null) | .Tags[]" >> $dir_name/$line.json
		echo "]}" >> $dir_name/$line.json
		sed -i 's|}|},|g' $dir_name/$line.json
		sed -i 's|]},|]}|g' $dir_name/$line.json
		sed -i 'N;s|},\n]|}\n]|' $dir_name/$line.json
		jq . $dir_name/$line.json > $dir_name/temp/$line.json
		cat $dir_name/temp/$line.json > $dir_name/$line.json
		echo Tags for the volume $line saved to $dir_name/$line.json
	else
		echo Ignored the volume id $line
	fi
done < $ec2_ebs_list

# Remove the temp directory
rm -rf $dir_name/temp

echo -e "\nVolume ID jsons saved under $dir_name directory\n"

# Iterate through the files and rename it to Name value from the tags
for FILE in ${dir_name}/*.json
do
	volume_name=`cat "$FILE" | jq -r '.Tags[] | select (.Key == "Name") | .Value'`
	if [ -f "$dir_name/$volume_name.json" ]; then
		echo File already exists for $FILE - $volume_name
	else
		if [ "$volume_name" != "" ]; then
			echo "mv $FILE $dir_name/$volume_name.json"
			mv "$FILE" "$dir_name/$volume_name.json"
		else
			echo No Name tag found for $FILE
		fi
	fi
done < $ec2_ebs_list
echo -e "\nVolume ID jsons renamed to Volume Name jsons under $dir_name directory"