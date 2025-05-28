#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m'

if [[ "${BUILD_USER_ID}" == "apilla" || "${BUILD_USER_ID}" == "sbose" || "${BUILD_USER_ID}" == "mfaizudeen" ]]; then
	printf "${PURPLE}Hello ${GREEN}$BUILD_USER_ID${PURPLE}, you are authorized to build this job.${NC}\n"
else
	printf "${PURPLE}Hello ${GREEN}$BUILD_USER_ID${PURPLE}, you are not authorized to build this job.${NC}\n"
	exit 1
fi

action=$1
server_ip=$2
username=$3

if [[ "${action}" == "Choose One" || "${server_ip}" == "Choose One" || "${username}" == "change_me" ]]; then
	printf "${RED}Too lazy to change the default values...?${BLUE}\n"
	exit 1
fi

if [[ "${server_ip}" == "Digital" ]]; then
	server_ip="10.153.30.33"
elif [[ "${server_ip}" == "InsuranceApps" ]]; then
	server_ip="10.153.30.115"
fi

printf "${PURPLE}Action${NC} : ${BLUE}$action${NC}\n"
printf "${PURPLE}Server IP${NC} : ${BLUE}$server_ip${NC}\n"
printf "${PURPLE}Username${NC} : ${BLUE}$username${NC}\n"

if [[ "${action}" == "Enable User" ]]; then
	action="-e"
elif [[ "${action}" == "Disable User" ]]; then
	action="-d"
fi

sshpass -f ~/.id_rsa_cred -P 'Enter passphrase for key' ssh -i ~/.ssh/id_rsa jenkins@$server_ip "
cd /opt/web/current/bin/;
cat ~/.id_rsa_cred | sudo -S ./add-user.sh ${action} ${username} -dc /common/apps/admin/configuration;
"