#!/bin/bash
cut_off=$1
log_file=/common/logs/scripts/purge_batch.log

match_string="Purge job Started @"

echo "Log archive job started @" $(date) >> $log_file
first_instance="`grep -m 1 "$match_string" $log_file`"
time_stamp=${first_instance#"$match_string"}
file_create_time=$(date --date="$time_stamp" +%s)
cut_off_date=$(date --date="$cut_off days ago" +%s)

if (($file_create_time > $cut_off_date))
then
echo "No files to purge today" >> $log_file
else
rm $log_file
echo "$log_file purged on $(date)" >> $log_file
fi

echo "Log archive job ends @" $(date) >> $log_file