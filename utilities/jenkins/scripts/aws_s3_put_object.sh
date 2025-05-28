#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m'

aws_profile=jenkins_s3_push
bucket_name=$ARTIFACTS_BACKUP_BUCKET_NAME
working_dir=/common/jenkins/build_backups/
source_folder=$JOB_NAME/$BUILD_NUMBER
destination_folder=s3://$bucket_name/artifacts_backup/$source_folder

cd $working_dir
printf "${BLUE}****************************************************${NC}\n"
printf "${PURPLE}Pushing artifacts to S3.${NC}\n"
sleep 3
aws --profile $aws_profile s3 sync $source_folder $destination_folder --quiet
if [ $? -eq 0 ]; then
	printf "${PURPLE}S3 Push Status${NC} : ${GREEN}Success${NC}\n"
else
	printf "${PURPLE}S3 Push Status${NC} : ${RED}Failure${NC}\n"
	printf "${RED}Please re-execute the action. If the issue is not resolved, contact the administrator.${NC}\n"
	exit 1
fi
printf "${BLUE}****************************************************${NC}\n"
sleep 1
printf "${RED}******************************************************************************************************************${NC}\n"
printf "${PURPLE}Cleaning up the local artifact directory : $BACKUP_PATH_BUILD${NC}\n"
rm -rf $BACKUP_PATH_BUILD/
sleep 3
printf "${RED}******************************************************************************************************************${NC}\n"