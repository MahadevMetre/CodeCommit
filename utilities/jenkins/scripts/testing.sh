#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m'

zip_file=$1

printf "${PURPLE}*****************************${GREEN}****************************${PURPLE}*****************************${NC}\n"
printf "${PURPLE}* ${BLUE}Login to the Nginx Golden Source Instance and execute the following commands in red.${NC}\n"
printf "${PURPLE}* ${RED}sudo su -${NC}\n"
printf "${PURPLE}* ${RED}cd /root/scripts/${NC}\n"
folder_name=`echo ${zip_file} | cut -f1 -d'.'`
printf "${PURPLE}* ${RED}./promote_ui.sh ${folder_name}${NC}\n"
printf "${PURPLE}* ${BLUE}Shutdown the instance via aws console.${NC}\n"
printf "${PURPLE}* ${BLUE}Execute terraform to update the AMI.${NC}\n"
printf "${PURPLE}* ${BLUE}Do an instance refresh.${NC}\n"
printf "${PURPLE}*****************************${GREEN}****************************${PURPLE}*****************************${NC}\n"