#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m'

if [[ "${BUILD_USER_ID}" == "sbose" || "${BUILD_USER_ID}" == "apilla" || "${BUILD_USER_ID}" == "ksenkodi" ]]; then
	printf "${PURPLE}Hello ${GREEN}$BUILD_USER_ID${PURPLE}, you are authorized to build this job.${NC}\n"
else
	printf "${PURPLE}Hello ${GREEN}$BUILD_USER_ID${PURPLE}, you are not authorized to build this job.${NC}\n"
	exit 1
fi

src_file=$1
server_ip=$2
server_user_name=$3
dest_file="/common/deploy/"

if [[ "${src_file}" == "must_change_this" || "${server_ip}" == "must_change_this" || "${server_user_name}" == "must_change_this" ]]; then
	printf "${RED}Too lazy to change the default values...?${NC}\n"
	exit 1
fi

cd $WORKSPACE

if [ ! -f "$src_file" ]; then
	printf "${RED}File ${GREEN}$src_file ${RED}not found. Exiting abnormally.${NC}\n"
	exit 1
fi

printf "${PURPLE}File Name : ${GREEN}$src_file${NC}\n"
printf "${PURPLE}Server IP : ${GREEN}$server_ip${NC}\n"
printf "${PURPLE}User Name : ${GREEN}$server_user_name${NC}\n"

printf "${PURPLE}Pushing file ${GREEN}$src_file ${PURPLE}to ${GREEN}$server_ip:$dest_file ${PURPLE}using username ${GREEN}$server_user_name${NC}\n"

sshpass -f ~/.id_rsa_cred -P 'Enter passphrase for key' scp $src_file $server_user_name@$server_ip:$dest_file
if [ $? -eq 0 ]; then
	printf "${PURPLE}File Transfer Status${NC} : ${GREEN}Success${BLUE}\n"
else
	printf "${PURPLE}File Transfer Status${NC} : ${RED}Failure${NC}\n"
	exit 1
fi