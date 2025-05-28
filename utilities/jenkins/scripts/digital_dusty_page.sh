#!/bin/bash

jenkins_user=$BUILD_USER_ID
action=$1
environment=$2
ssh_user=jenkins
aws_profile="fmservice_vanity_jenkins_user_${environment}"

if [[ "${jenkins_user}" == "apilla" || "${jenkins_user}" == "mfaizudeen" || "${jenkins_user}" == "sbose" || "${jenkins_user}" == "ksenkodi" || "${jenkins_user}" == "ksimmons" ]]; then
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

if [[ "${environment}" == "Choose One" || "${action}" == "Choose One" ]]; then
	echo "Too lazy to change the default values...?"
	exit 1
fi

today=`date +%Y%m%d`
timestamp=`date +%H_%M_%S`
ws_path=$WORKSPACE/$today/$timestamp
server_ip_list_file_name=server_ip_list_$today.txt

mkdir -p $ws_path
cd $ws_path

aws --profile $aws_profile ec2 describe-instances --filters "Name=tag:Name,Values=nginx-digital-instance-${environment}" | jq -r '.Reservations[].Instances[] | select (.State.Name == "running") | .PrivateIpAddress' >> $server_ip_list_file_name

server_count=`cat $server_ip_list_file_name | wc -l`

if [ "$server_count" -lt 1 ]; then
	echo "Error occured while fetching the UI server list, exiting the process."
	exit 1
fi

dusty_action_status=0

for (( i = 1; i <= $server_count; i++ ))
do
	server_ip=`sed "${i}q;d" $server_ip_list_file_name`
	ssh-keygen -f "/home/jenkins/.ssh/known_hosts" -R "$server_ip" > /dev/null
	host_key=`ssh-keyscan -H $server_ip | grep ecdsa-sha2-nistp256 | tail -1`
	echo $host_key >> /home/jenkins/.ssh/known_hosts
	sshpass -f ~/.id_rsa_cred -P 'Enter passphrase for key' ssh -i ~/.ssh/id_rsa $ssh_user@$server_ip " 
	sshpass -f ~/.id_rsa_cred -P 'password for $ssh_user:' sudo sh /root/scripts/dusty_page.sh $action"
	if [ "$?" -ne 0 ]; then
		dusty_action_status=1
	fi
	ssh-keygen -f "/home/jenkins/.ssh/known_hosts" -R "$server_ip" > /dev/null
done

if [ "$dusty_action_status" -ne 0 ]; then
	echo "Error occured while toggling the dusty page, exiting the process."
	exit 1
else
	echo "Successfully ${action}d the dusty page."
fi