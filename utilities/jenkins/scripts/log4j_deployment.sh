#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m'

server_host=$1
environment=$2

file_name="jboss-local-log4j2.xml"
server_ip="NULL"
dest_path="NULL"

if [[ "${server_host}" == "insuranceapps" ]]; then
	user_name="gitlab"
	dest_path=/common/insuranceapps/etc/insuranceapps/properties
	if [[ "${environment}" == "devel" ]]; then
		server_ip="10.153.14.187"
	elif [[ "${environment}" == "staging" ]]; then
		server_ip="10.153.19.220"
	elif [[ "${environment}" == "production" ]]; then
		server_ip="10.153.30.115"
		user_name="jenkins"
		dest_path=/common/apps/etc/insuranceapps/properties
	elif [[ "${environment}" == "dr" ]]; then
		server_ip="10.153.42.115"
		user_name="gitlab"
		dest_path=/common/apps/etc/insuranceapps/properties
	fi
elif [[ "${server_host}" == "digital" ]]; then
	user_name="jenkins"
	dest_path=/common/apps/etc/insuranceapps/properties
	if [[ "${environment}" == "devel" ]]; then
		server_ip="10.153.14.33"
	elif [[ "${environment}" == "staging" ]]; then
		server_ip="10.153.19.227"
	elif [[ "${environment}" == "production" ]]; then
		server_ip="10.153.30.33"
	fi
fi

cd $WORKSPACE
sshpass -f ~/.id_rsa_cred -P 'Enter passphrase for key' scp $file_name $user_name@$server_ip:$dest_path/$file_name
if [ $? -eq 0 ]; then
	printf "${PURPLE}File Transfer Status${NC} : ${GREEN}Success${NC}\n"
else
	printf "${PURPLE}File Transfer Status${NC} : ${RED}Failure${NC}\n"
	printf "${RED}Please re-execute the action. If the issue is not resolved, contact the administrator.${NC}\n"
	exit 1
fi