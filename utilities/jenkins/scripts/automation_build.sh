#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m'

set +x
project_var=$(echo $JOB_NAME|cut -d_ -f2)
archive_path="/home/jenkins/automation"
printf "${PURPLE}Job name${NC} : ${BLUE}$JOB_NAME${NC}\n"
printf "${PURPLE}Project${NC} : ${BLUE}$project_var${NC}\n"
printf "${PURPLE}Archive path${NC} : ${BLUE}$archive_path${NC}\n"

cd $WORKSPACE
chmod -R 775 $WORKSPACE
printf "${PURPLE}Archiving contents of ${BLUE}$WORKSPACE${NC}\n"

tar --exclude='*.svn*' --exclude='./target' -cf ${archive_path}/${project_var}_automation.tar .
printf "${PURPLE}Archive created under ${BLUE}${archive_path}/${project_var}_automation.tar${NC}\n"

cd ${archive_path}
printf "${PURPLE}Transferring the archive ${BLUE}${project_var}_automation.tar to ${GREEN}10.153.19.210:/common/deploy/automation/${NC}\n"

sshpass -f ~/.id_rsa_cred -P 'Enter passphrase for key' scp ${project_var}_automation.tar jenkins@10.153.19.210:/common/deploy/automation/
if [ $? -eq 0 ]; then
	printf "${PURPLE}File Transfer Status${NC} : ${GREEN}Success${NC}\n"
else
	printf "${PURPLE}File Transfer Status${NC} : ${RED}Failure${NC}\n"
	printf "${RED}Please re-execute the action. If the issue is not resolved, contact the administrator.${NC}\n"
	exit 1
fi