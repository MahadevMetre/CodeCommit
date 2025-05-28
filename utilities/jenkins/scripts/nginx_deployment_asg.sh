#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m'

workspace=$1
environment=$2
file_name=$3
ui_folder_root=`tar --exclude="*/*" -tf $workspace/$file_name`

server_ip=`grep -w $environment /opt/scripts/properties/nginx_ips_asg.props | cut -d'=' -f2`
user_name=`grep -w $server_ip /opt/scripts/properties/nginx_usernames_asg.props | cut -d'=' -f2`
asg_instance_name=`grep -w $environment /opt/scripts/properties/nginx_instances_asg.props | cut -d'=' -f2`
aws_profile=`grep -w $environment /opt/scripts/properties/nginx_awsprofiles_asg.props | cut -d'=' -f2`
asg_ssh_user="jenkins"

printf "${PURPLE}Workspace${NC} : ${BLUE}$workspace${NC}\n"
printf "${PURPLE}Server IP${NC} : ${BLUE}$server_ip${NC}\n"
printf "${PURPLE}Environment${NC} : ${BLUE}$environment${NC}\n"
printf "${PURPLE}Archive${NC} : ${BLUE}$file_name${NC}\n"

printf "${PURPLE}Transferring ${GREEN}$file_name ${PURPLE}to EFS ${BLUE}$server_ip:/common/deploy/angular/${NC}\n"

sshpass -f ~/.id_rsa_cred -P 'Enter passphrase for key' scp $workspace/$file_name $user_name@$server_ip:/common/deploy/angular/
if [ $? -eq 0 ]; then
	printf "${PURPLE}File Transfer Status${NC} : ${GREEN}Success${NC}\n"
	aws --profile $aws_profile ec2 describe-instances --filters "Name=tag:Name,Values=$asg_instance_name" | jq -r '.Reservations[].Instances[] | select (.State.Name == "running") | .PrivateIpAddress' > server_ip_list.txt
	server_count=`cat server_ip_list.txt | wc -l`
	if [ "$server_count" -lt 1 ]; then
		printf "${RED}Error occured while fetching the UI server list, exiting the process.\n"
		exit 1
	fi
	nginx_refresh_status=0
	for (( i = 1; i <= $server_count; i++ ))
	do
		server_ip=`sed "${i}q;d" server_ip_list.txt`
		printf "${PURPLE}Updating UI artifacts in server ${GREEN}$server_ip${BLUE}\n"
		ssh-keygen -f "/home/jenkins/.ssh/known_hosts" -R "$server_ip" > /dev/null 2>&1
		host_key=`ssh-keyscan -H $server_ip | grep ecdsa-sha2-nistp256 | tail -1`
		echo $host_key >> /home/jenkins/.ssh/known_hosts
		sshpass -f ~/.id_rsa_cred -P 'Enter passphrase for key' ssh -i ~/.ssh/id_rsa $asg_ssh_user@$server_ip " 
		sshpass -f ~/.id_rsa_cred -P 'password for $asg_ssh_user:' sudo cp /common/deploy/angular/$file_name /usr/share/nginx/html/
		sshpass -f ~/.id_rsa_cred -P 'password for $asg_ssh_user:' sudo rm -rf /usr/share/nginx/html/$ui_folder_root
		cd /usr/share/nginx/html
		sshpass -f ~/.id_rsa_cred -P 'password for $asg_ssh_user:' sudo tar xf $file_name
		sshpass -f ~/.id_rsa_cred -P 'password for $asg_ssh_user:' sudo rm -rf /usr/share/nginx/html/$file_name
		sshpass -f ~/.id_rsa_cred -P 'password for $asg_ssh_user:' sudo systemctl restart nginx"
		if [ "$?" -ne 0 ]; then
			nginx_refresh_status=1
			printf "${RED}Operation failed in server ${GREEN}$server_ip${NC}\n"
		else
			printf "${PURPLE}Operation success in server ${GREEN}$server_ip${GREEN}\n"
		fi
		ssh-keygen -f "/home/jenkins/.ssh/known_hosts" -R "$server_ip" > /dev/null 2>&1
	done
	if [ "$nginx_refresh_status" -ne 0 ]; then
		printf "${RED}Error occured while restarting the UI service, exiting the process.\n"
		exit 1
	fi
else
	printf "${PURPLE}File Transfer Status${NC} : ${RED}Failure${NC}\n"
	printf "${RED}Please re-execute the action. If the issue is not resolved, contact the administrator.${NC}\n"
	exit 1
fi