#!/bin/bash

#Variables
log_file=/common/logs/scripts/purge_directory.log
prop_file=/home/jbadmin/scripts/properties/folder_delete.prop
folders_purged=0

#Validate Prop files
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

#Delete Empty directories
echo "Reading properties file $prop_file for paths" >> $log_file
input="$prop_file"
while IFS= read -r path
do
  echo "Path being checked is $path" >> $log_file
  path_folders=find $path -type d -empty | wc -l
  echo "The following $path_folders will be purged from $path"
  find $path -type d -empty >> $log_file
  find $path -type d -empty -exec rm -rf {} + >> $log_file
  folders_purged=$(($folders_purged+$path_folders))
done < "$input"
echo "Total files purged is $folders_purged"
echo "File directory purge job completed @" $(date) >> $log_file

