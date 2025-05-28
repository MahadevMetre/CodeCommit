#!/bin/bash

jenkins_user=$BUILD_USER_ID
manual_exec=$1
environment=$2

if [[ "${manual_exec}" == "true" ]]; then
	if [[ "${jenkins_user}" == "apilla" || "${jenkins_user}" == "ksenkodi" || "${jenkins_user}" == "sbose" || "${jenkins_user}" == "mfaizudeen" ]]; then
		if [[ "${jenkins_user}" == "sbose" || "${jenkins_user}" == "mfaizudeen" ]]; then
			if [[ "${environment}" == "pci" ]]; then
				echo "Hey there $BUILD_USER, you are not allowed to perform this action."
				echo "Please reach out to admin for assistance."
				exit 1
			fi
		fi
	else
		echo "Hey there $BUILD_USER, you are not allowed to perform this action."
		echo "Please reach out to admin for assistance."
		exit 1
	fi
else
	if [[ "${jenkins_user}" == "timer" ]]; then
		environment="pci"
	else
		echo "Hey there $BUILD_USER, you are not allowed to perform this action."
		echo "Please reach out to admin for assistance."
		exit 1
	fi
fi

if [[ "${environment}" == "Choose One" ]]; then
	echo "Too lazy to change the default values...?"
	exit 1
fi

ssh_user="jenkins"
email_from="jenkins@franklinmadisonds.com"
email_to="FMG_DIGITAL_BUSINESS@franklin-madison.com"
bucket_name="fmservice-vanity-input-${environment}"
aws_profile="fmservice_vanity_jenkins_user_${environment}"

if [ "$environment" == "stage" ]; then
	jboss_admin_ip="10.153.19.227"
	email_subject="FMService Vanity URL Update - Stage"
elif [ "$environment" == "pci" ]; then
	jboss_admin_ip="10.153.30.33"
	email_subject="FMService Vanity URL Update - Prod"
else
	echo Invalid value for environment
	exit 1
fi

today=`date +%Y%m%d`
timestamp=`date +%H_%M_%S`
ws_path=$WORKSPACE/$today/$timestamp
input_excel_name=Vanity_$today.xlsx
input_excel_path=$ws_path/$input_excel_name
duplicate_excel_entries_file_name=duplicate_excel_entries_$today.txt
duplicate_excel_entries_file_path=$ws_path/$duplicate_excel_entries_file_name
invalid_from_file_name=invalid_from_$today.txt
invalid_from_file_path=$ws_path/$invalid_from_file_name
invalid_to_file_name=invalid_to_$today.txt
invalid_to_file_path=$ws_path/$invalid_to_file_name
processed_file_name=vanity_processed_$today.txt
processed_file_path=$ws_path/$processed_file_name
vanity_backup_file_name=fmservice_vanity_$environment_$today.cfg
vanity_backup_file_path=$ws_path/$vanity_backup_file_name
server_ip_list_file_name=server_ip_list_$today.txt
vanity_final_file_name=fmservice_vanity_$environment.cfg
remote_vanity_file_path=/common/nginx/sites-enabled/$vanity_final_file_name

mkdir -p $ws_path

aws --profile $aws_profile s3 cp s3://$bucket_name/$input_excel_name $ws_path

if [ ! -f "$input_excel_path" ]; then
	echo $input_excel_name not found in the bucket $bucket_name, exiting the process.
	rm -rf $ws_path
	exit 1
fi

send_email() {
	echo -e "Subject: $email_subject\n$email_content" | /usr/sbin/sendmail -f $email_from -t $email_to
	echo -e "Subject: $email_subject\n$email_content" | /usr/sbin/sendmail -f $email_from -t "FMG_CLOPS_Proj@franklin-madison.com"
}

python /opt/scripts/digital_vanity_parse_excel.py $input_excel_path $processed_file_path $invalid_from_file_path $invalid_to_file_path $duplicate_excel_entries_file_path

if [ -f "$invalid_from_file_path" ]; then
	invalid_line_count=`cat $invalid_from_file_path | wc -l`
	if [ "$invalid_line_count" -gt 1 ]; then
		error_message="Invalid entries found in the 'From' field, exiting the process."
		echo $error_message
		email_content="Hello,\n\nWe have encountered an error while processing the file $input_excel_name.\n\nError message : "$error_message"\n\nFind the invalid entries below.\n\n"`tail -n+2 $invalid_from_file_path`"\n\nFix the invalid entries and re-upload the excel sheet to process during the next slot."
		send_email
		exit 1
	fi
fi

if [ -f "$invalid_to_file_path" ]; then
	invalid_line_count=`cat $invalid_to_file_path | wc -l`
	if [ "$invalid_line_count" -gt 1 ]; then
		error_message="Invalid URL format found in the 'To' field, exiting the process."
		echo $error_message
		email_content="Hello,\n\nWe have encountered an error while processing the file $input_excel_name.\n\nError message : "$error_message"\n\nFind the invalid entries below.\n\n"`tail -n+2 $invalid_to_file_path`"\n\nFix the invalid entries and re-upload the excel sheet to process during the next slot."
		send_email
		exit 1
	fi
fi

if [ -f "$duplicate_excel_entries_file_path" ]; then
	error_message="Duplicate entries found in the input excel, exiting the process."
	echo $error_message
	email_content="Hello,\n\nWe have encountered an error while processing the file $input_excel_name.\n\nError message : "$error_message"\n\nFind the duplicate entries below.\n\n"`cat $duplicate_excel_entries_file_path`"\n\nRemove the duplicate entries and re-upload the excel sheet to process during the next slot."
	send_email
	exit 1
fi

if [ ! -f "$processed_file_path" ]; then
	error_message="Error occured while parsing the input excel, exiting the process."
	echo $error_message
	email_content="Hello,\n\nWe have encountered an error while processing the file $input_excel_name.\n\nError message : "$error_message"\n\nPlease ensure you have formatted the excel sheet properly, If you still feel the input excel sheet is proper, please reach out to support."
	send_email
	exit 1
else
	line_count=`cat $processed_file_path | wc -l`
	if [ "$line_count" -lt 2 ]; then
		error_message="Vanity URLs not found in the input excel, exiting the process."
		echo $error_message
		email_content="Hello,\n\nWe have encountered an error while processing the file $input_excel_name.\n\nError message : "$error_message"\n\nPlease ensure the excel sheet contains atleast 1 vanity URL entry."
		send_email
		exit 1
	fi
fi

sshpass -f ~/.id_rsa_cred -P 'Enter passphrase for key' scp $ssh_user@$jboss_admin_ip:$remote_vanity_file_path $vanity_backup_file_path

if [ "$?" -ne 0 ]; then
	error_message="Error occured while fetching the existing URL list from server, exiting the process."
	echo $error_message
	email_content="Hello,\n\nWe have encountered an error while processing the file $input_excel_name.\n\nError message : "$error_message"\n\nPlease reach out to support."
	send_email
	exit 1
fi

cd $ws_path

existing_records_count=`grep "redirect;" $vanity_backup_file_name | wc -l`
new_records_count=`grep "redirect;" $processed_file_name | wc -l`
total_records_count=`expr $existing_records_count + $new_records_count`

if [ "$total_records_count" -gt 3000000 ]; then
	error_message="The total number of vanity records is $total_records_count which exceeds the allowed limit of 30,00,000 records, exiting the process."
	echo $error_message
	email_content="Hello,\n\nWe have encountered an error while processing the file $input_excel_name.\n\nError message : "$error_message"\n\nPlease cleanup the old records."
	send_email
	rm $vanity_backup_file_name
	rm $processed_file_name
	exit 1
fi

cat $vanity_backup_file_name >> $processed_file_name

awk -F" " '!_[$2]++' $processed_file_name > $vanity_final_file_name

aws --profile $aws_profile ec2 describe-instances --filters "Name=tag:Name,Values=nginx-digital-instance-${environment}" | jq -r '.Reservations[].Instances[] | select (.State.Name == "running") | .PrivateIpAddress' >> $server_ip_list_file_name

server_count=`cat $server_ip_list_file_name | wc -l`

if [ "$server_count" -lt 1 ]; then
	error_message="Error occured while fetching the UI server list, exiting the process."
	echo $error_message
	email_content="Hello,\n\nWe have encountered an error while processing the file $input_excel_name.\n\nError message : "$error_message"\n\nPlease reach out to support."
	send_email
	exit 1
fi

sshpass -f ~/.id_rsa_cred -P 'Enter passphrase for key' scp $vanity_final_file_name $ssh_user@$jboss_admin_ip:/common/deploy/
sshpass -f ~/.id_rsa_cred -P 'Enter passphrase for key' ssh -i ~/.ssh/id_rsa $ssh_user@$jboss_admin_ip "
sshpass -f ~/.id_rsa_cred -P 'password for $ssh_user:' sudo mv /common/deploy/$vanity_final_file_name $remote_vanity_file_path"

if [ "$?" -ne 0 ]; then
	error_message="Error occured while pushing the updated URL list to server, exiting the process."
	echo $error_message
	email_content="Hello,\n\nWe have encountered an error while processing the file $input_excel_name.\n\nError message : "$error_message"\n\nPlease reach out to support."
	send_email
	exit 1
fi

nginx_refresh_status=0

for (( i = 1; i <= $server_count; i++ ))
do
	server_ip=`sed "${i}q;d" $server_ip_list_file_name`
	ssh-keygen -f "/home/jenkins/.ssh/known_hosts" -R "$server_ip" > /dev/null 2>&1
	host_key=`ssh-keyscan -H $server_ip | grep ecdsa-sha2-nistp256 | tail -1`
	echo $host_key >> /home/jenkins/.ssh/known_hosts
	sshpass -f ~/.id_rsa_cred -P 'Enter passphrase for key' ssh -i ~/.ssh/id_rsa $ssh_user@$server_ip " 
	sshpass -f ~/.id_rsa_cred -P 'password for $ssh_user:' sudo systemctl restart nginx"
	if [ "$?" -ne 0 ]; then
		nginx_refresh_status=1
	fi
	ssh-keygen -f "/home/jenkins/.ssh/known_hosts" -R "$server_ip" > /dev/null 2>&1
done

if [ "$nginx_refresh_status" -ne 0 ]; then
	error_message="Error occured while restarting the UI service, exiting the process."
	echo $error_message
	email_content="Hello,\n\nWe have encountered an error while processing the file $input_excel_name.\n\nError message : "$error_message"\n\nPlease reach out to support."
	send_email
	sshpass -f ~/.id_rsa_cred -P 'Enter passphrase for key' scp $vanity_backup_file_name $ssh_user@$jboss_admin_ip:/common/deploy/
	sshpass -f ~/.id_rsa_cred -P 'Enter passphrase for key' ssh -i ~/.ssh/id_rsa $ssh_user@$jboss_admin_ip "
	sshpass -f ~/.id_rsa_cred -P 'password for $ssh_user:' sudo mv /common/deploy/$vanity_backup_file_name $remote_vanity_file_path"
	exit 1
else
	status_message="Successfully updated the vanity URLs list."
	echo $status_message
	email_content="Hello,\n\nWe have successfully processed the file $input_excel_name.\n\nStatus message : "$status_message
	send_email
	# rm $processed_file_name
	# rm $vanity_final_file_name
fi