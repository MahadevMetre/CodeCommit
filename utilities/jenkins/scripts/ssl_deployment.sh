#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m'

array[0]="RED"
array[1]="GREEN"
array[2]="PURPLE"
array[3]="BLUE"
array_size=${#array[@]}

jenkins_user=$BUILD_USER_ID

directory=$1
cert_name=$2
server_ip=$3
key_name=$4
environment=$5

if [[ "${jenkins_user}" == "apilla" || "${jenkins_user}" == "ksenkodi" || "${jenkins_user}" == "sbose" || "${jenkins_user}" == "mfaizudeen" ]]; then
	if [[ "${jenkins_user}" == "sbose" || "${jenkins_user}" == "mfaizudeen" ]]; then
		if [[ "${environment}" == "pci" || "${environment}" == "dr" ]]; then
			printf "${PURPLE}Hey there ${GREEN}$BUILD_USER${PURPLE}, you are not allowed to perform this action.${RED}\n"
			printf "Please reach out to admin for assistance.\n"
			exit 1
		fi
	fi
else
	printf "${PURPLE}Hey there ${GREEN}$BUILD_USER${PURPLE}, you are not allowed to perform this action.${RED}\n"
	printf "Please reach out to admin for assistance.\n"
	exit 1
fi

index=$(($RANDOM % $array_size))
color=${array[$index]}
printf "${!color}"

sshpass -f ~/.id_rsa_cred -P 'Enter passphrase for key' scp -r $directory/$cert_name gitlab@$server_ip:/common/deploy/
sshpass -f ~/.id_rsa_cred -P 'Enter passphrase for key' scp -r $directory/$key_name gitlab@$server_ip:/common/deploy/

sshpass -f ~/.id_rsa_cred -P 'Enter passphrase for key' ssh -i ~/.ssh/id_rsa gitlab@$server_ip "
sshpass -f ~/.id_rsa_cred -P 'password for gitlab:' sudo cp /common/deploy/$cert_name /etc/nginx/ssl/wildcard_fmds.pem;
sshpass -f ~/.id_rsa_cred -P 'password for gitlab:' sudo cp /common/deploy/$key_name /etc/nginx/ssl/privkey.pem;
sudo service nginx restart"
printf "${ORANGE}----------------------------------------<><><><><><><><><><>----------------------------------------${NC}\n"