#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m'

aws_profile=jenkins_s3_push
bucket_name=$ARTIFACTS_BACKUP_BUCKET_NAME
working_dir=/common/jenkins/promoted_builds
source_folder=s3://$bucket_name/artifacts_backup/$JOB_NAME/$BUILD_NUMBER/
destination_folder=$working_dir/$JOB_NAME/$BUILD_NUMBER/

cd $working_dir
printf "${BLUE}****************************************************${NC}\n"
printf "${PURPLE}Fetching artifacts from S3.${NC}\n"
sleep 3
if [ ! -d "$destination_folder" ]; then
	aws --profile $aws_profile s3 sync $source_folder $destination_folder --quiet
	if [ "$(ls -A $destination_folder)" ]; then
		printf "${PURPLE}S3 Fetch Status${NC} : ${GREEN}Success${NC}\n"
	else
		printf "${PURPLE}S3 Fetch Status${NC} : ${RED}Failure${NC}\n"
		printf "${RED}Please re-execute the action. If the issue is not resolved, contact the administrator.${NC}\n"
		rm -rf $destination_folder
		printf "${BLUE}****************************************************${NC}\n"
		exit 1
	fi
else
	printf "${GREEN}Artifacts already exist in local storage.${NC}\n"
	printf "${PURPLE}S3 Fetch Status${NC} : ${ORANGE}Skipped${NC}\n"
fi
printf "${BLUE}****************************************************${NC}\n"