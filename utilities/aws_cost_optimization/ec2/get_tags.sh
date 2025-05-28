#!/bin/bash

# Get environment name as first argument : dev,stage,qa,shared,pci,dr
environment=$1

if [[ "${environment}" == "dev" || "${environment}" == "stage" || "${environment}" == "qa" || "${environment}" == "shared" || "${environment}" == "pci" || "${environment}" == "dr" ]]; then
	echo Environment is $environment
else
	echo Invalid value for environment : $environment
	exit 1
fi

# File for saving instance json
input_file=${environment}_ec2_info.json
# File for saving instance ids
ec2_instance_list=${environment}_instance_list.txt
# File for saving ignore list
ignore_list=${environment}_ignore_list.txt
# Directory for json creation
dir_name=${environment}_tag_list

# List the ec2 instance properties and use jq tool to get the instance ids
aws ec2 describe-instances > $input_file
cat $input_file | jq -r '.Reservations[].Instances[].InstanceId' > $ec2_instance_list
echo Saved the instances info to $input_file

# Create the ignore list if not exists
touch $ignore_list

# Change from Windows CRLF to Unix like LF line endings (\r\n to \n)
sed -i 's|\r\n|\n|g' $ec2_instance_list
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
		# aws ec2 describe-instances --instance-ids $line | jq -r '.Reservations[].Instances[].Tags[]' >> $dir_name/$line.json
		cat $input_file | jq -r ".Reservations[].Instances[] | select (.InstanceId == \"$line\") | .Tags[]" >> $dir_name/$line.json
		echo "]}" >> $dir_name/$line.json
		sed -i 's|}|},|g' $dir_name/$line.json
		sed -i 's|]},|]}|g' $dir_name/$line.json
		sed -i 'N;s|},\n]|}\n]|' $dir_name/$line.json
		jq . $dir_name/$line.json > $dir_name/temp/$line.json
		cat $dir_name/temp/$line.json > $dir_name/$line.json
		echo Tags for the instance $line saved to $dir_name/$line.json
	else
		echo Ignored the instance id $line
	fi
done < $ec2_instance_list

# Remove the temp directory
rm -rf $dir_name/temp

echo -e "\nInstance ID jsons saved under $dir_name directory\n"

# Iterate through the files and rename it to Name value from the tags
for FILE in ${dir_name}/*.json
do
	instance_name=`cat "$FILE" | jq -r '.Tags[] | select (.Key == "Name") | .Value'`
	if [ -f "$dir_name/$instance_name.json" ]; then
		echo File already exists for $FILE - $instance_name
	else
		echo "mv $FILE $dir_name/$instance_name.json"
		mv "$FILE" "$dir_name/$instance_name.json"
	fi
done < $ec2_instance_list
echo -e "\nInstance ID jsons renamed to Instance Name jsons under $dir_name directory"