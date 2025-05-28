#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m'

if [ $# -eq 5 ]; then
	dev_env=false
else
	dev_env=true
fi

workspace=$1
application=$2
zip_file=$3

server_ip=$4
if [ "$dev_env" == "false" ]; then
	server2_ip=$5
else
	server2_ip=NA
fi
user_name=gitlab

printf "${PURPLE}Workspace${NC} : ${BLUE}$workspace${NC}\n"
printf "${PURPLE}Server 1 IP${NC} : ${BLUE}$server_ip${NC}\n"
printf "${PURPLE}Server 2 IP${NC} : ${BLUE}$server2_ip${NC}\n"
printf "${PURPLE}Application${NC} : ${BLUE}$application${NC}\n"
printf "${PURPLE}Zip file${NC} : ${BLUE}$zip_file${NC}\n"

printf "${PURPLE}Transferring ${GREEN}$zip_file ${PURPLE}to EFS ${BLUE}$server_ip:/common/deploy/angular/${NC}\n"

sshpass -f ~/.id_rsa_cred -P 'Enter passphrase for key' scp $workspace/$zip_file $user_name@$server_ip:/common/deploy/angular/
if [ $? -eq 0 ]; then
	printf "${PURPLE}File Transfer Status${NC} : ${GREEN}Success${NC}\n"
else
	printf "${PURPLE}File Transfer Status${NC} : ${RED}Failure${NC}\n"
	printf "${RED}Please re-execute the action. If the issue is not resolved, contact the administrator.${NC}\n"
	exit 1
fi

deploy () {
	printf "${PURPLE}Starting deployment to server ${GREEN}$1${NC}\n"

	sshpass -f ~/.id_rsa_cred -P 'Enter passphrase for key' ssh -i ~/.ssh/id_rsa $user_name@$1 "
	sshpass -f ~/.id_rsa_cred -P 'password for gitlab:' sudo cp /common/deploy/angular/$zip_file /usr/share/nginx/html/
	cd /usr/share/nginx/html/
	sshpass -f ~/.id_rsa_cred -P 'password for gitlab:' sudo rm -rf $application
	echo "Unzipping archive $zip_file inside /usr/share/nginx/html/"
	sshpass -f ~/.id_rsa_cred -P 'password for gitlab:' sudo tar xf $zip_file
	if [ $? -eq 0 ]; then
		echo "Unzip status : Success"
	else
		echo "Unzip status : Failure"
		exit 1
	fi
	sudo service nginx restart
	if [ $? -eq 0 ]; then
		echo "Nginx restart status : Success"
	else
		echo "Nginx restart status : Failure"
		exit 1
	fi
	sshpass -f ~/.id_rsa_cred -P 'password for gitlab:' sudo rm -rf $zip_file"

	if [ $? -eq 0 ]; then
		printf "${PURPLE}Deployment Status${NC} : ${GREEN}Success${NC}\n"
	else
		printf "${PURPLE}Deployment Status${NC} : ${RED}Failure${NC}\n"
		printf "${RED}Please re-execute the action. If the issue is not resolved, contact the administrator.${NC}\n"
		exit 1
	fi
}

deploy $server_ip
if [ "$dev_env" == "false" ]; then
	deploy $server2_ip
fi