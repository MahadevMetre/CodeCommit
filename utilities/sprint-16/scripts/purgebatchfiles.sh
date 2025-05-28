#!/bin/bash

prop_file=/home/jbadmin/scripts/properties/purge_batch.prop
file_path=/common/data/insurance/batch/
log_file=/common/logs/scripts/purge_batch.log

expiry_days=$1

echo "" >> $log_file
echo "Initialising Script purgebatchfiles.sh" >> $log_file
echo "" >> $log_file

echo "Purge job Started @" $(date) >> $log_file
if [ -f "$prop_file" ];
then
echo $prop_file exists in path >> $log_file
echo Continuing with the purge >> $log_file
else
echo $prop_file does not exist >> $log_file
echo Purge job aborted @ $(date) >> $log_file
exit 1
fi

exclude_path=$(grep file_path $prop_file | tr '\n' ' ')
exclude_path="${exclude_path//file_path/-path}"

exclude_type=$(grep file_type $prop_file | tr '\n' ' ')
exclude_type="${exclude_type//file_type/! -name}"

if [ ${#exclude_path} -eq 0 ];
then
echo "No directory to exclude from purge" >> $log_file
find_path=""
else
find_path="-type d \( $exclude_path \) -prune -false -o"
echo "Excluded path are ${exclude_path//-path/}" >> $log_file
fi

if [ ${#exclude_type} -eq 0 ];
then
find_type=""
echo "No file type to exclude from purge" >> $log_file
else
find_type=$exclude_type
echo "Excluded file type are ${exclude_type//! -name/}" >> $log_file
fi

find_time_stamp="-type f -mtime +$expiry_days"
find_command="find $file_path $find_path $find_time_stamp $find_type"

count=$(eval "$find_command -print | wc -l")
if (($count != 0))
then
echo $count files are found >> $log_file
eval "$find_command -print" >> $log_file
echo "Removing $count files older than $expiry_days days" >> $log_file
find $file_path -type f -mtime +$expiry_days -exec rm -f {} \; >> $log_file
find $file_path -type f -mtime +$expiry_days -executable -exec rm '{}' \;
echo "" >> $log_file
else
echo "No files found matching the criteria" >> $log_file
fi
echo "Purge process Completed at "$(date) >> $log_file