#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m'

account=$1
jenkins_user=$BUILD_USER_ID
job_config_file="/opt/scripts/config/apigw_update.json"

build_permission=`jq -r ".\"$account\" | any(index(\"$jenkins_user\"))" "$job_config_file"`

if [[ "$build_permission" != "true" ]];
then
	printf "${PURPLE}Hello ${GREEN}$BUILD_USER${PURPLE}, you are not authorized to build this job.${RED}\n"
	exit 1
fi

api_name=$2
description=$3

if [[ "${account}" == "Choose One" || "${api_name}" == "Choose One" || "${description}" == "must_change_this" ]]; then
	printf "${RED}Too lazy to change the default values...?${BLUE}\n"
	exit 1
fi

desc_length=`echo $description | wc -m`

if [[ "$desc_length" -lt 21  ]]; then
	printf "${RED}Deployment description too short.${BLUE}\n"
	exit 1
fi

data=`jq -r ".api_list.\"$account\".\"$api_name\"" "$job_config_file"`

if [[ "$data" == "null" ]];
then
	printf "${RED}Invalid Account & API combination.${BLUE}\n"
	exit 1
fi

rest_api_id=`echo $data | cut -d'/' -f1`
stage_name=`echo $data | cut -d'/' -f2`
file_name=`echo $data | cut -d'/' -f3`

printf "${PURPLE}Account : ${GREEN}$account${NC}\n"
printf "${PURPLE}API Name : ${GREEN}$api_name${NC}\n"
printf "${PURPLE}Rest API ID : ${GREEN}$rest_api_id${NC}\n"
printf "${PURPLE}Stage Name : ${GREEN}$stage_name${NC}\n"
printf "${PURPLE}Deployment Description : ${GREEN}$description${NC}\n"
printf "${PURPLE}File Name : ${GREEN}$file_name${NC}\n"

# Choose the right account
if [[ "${account}" == "dev" ]]; then
	account_id=116762271881
	aws_user=terraform_svc_user
	region=us-east-1
elif [[ "${account}" == "stage" ]]; then
	account_id=702230634984
	aws_user=terraform_svc_user
	region=us-east-1
elif [[ "${account}" == "pci" ]]; then
	account_id=601751840347
	aws_user=terraform_svc_prod_user
	region=us-east-1
fi

role="terraform-execution-role"
KST_value=`aws sts assume-role --profile $aws_user --role-arn "arn:aws:iam::$account_id:role/$role" --role-session-name terraform_deploy --duration-seconds 1800 --query '[Credentials.AccessKeyId,Credentials.SecretAccessKey,Credentials.SessionToken]' --output text`

KST=($KST_value)

# Set the env variables
export AWS_DEFAULT_REGION="${region}"
export AWS_ACCESS_KEY_ID="${KST[0]}"
export AWS_ACCESS_KEY="${KST[0]}"
export AWS_SECRET_ACCESS_KEY="${KST[1]}"
export AWS_SECRET_KEY="${KST[1]}"
export AWS_SESSION_TOKEN="${KST[2]}"
export AWS_SECURITY_TOKEN="${KST[2]}"
export AWS_DELEGATION_TOKEN="${KST[2]}"

printf "${PURPLE}"
aws sts get-caller-identity

printf "${GREEN}"
aws apigateway put-rest-api --rest-api-id $rest_api_id --mode overwrite --fail-on-warnings --body "fileb://$WORKSPACE/$file_name"
printf "${BLUE}"
aws apigateway create-deployment --rest-api-id $rest_api_id --stage-name $stage_name --description "$description"
printf "${GREEN}"