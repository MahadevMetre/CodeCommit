#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m'

account=$1
bucket_name=$2
ui_path_root=$3

EMPTY_PATH=/home/jenkins/.keep_this_folder_empty/

# Choose the right account
if [[ "${account}" == "dev" ]]; then
	account_id=116762271881
elif [[ "${account}" == "qa" ]]; then
	account_id=634621569833
elif [[ "${account}" == "stage" ]]; then
	account_id=702230634984
elif [[ "${account}" == "shared" ]]; then
	account_id=964190570136
elif [[ "${account}" == "pci" ]]; then
	account_id=601751840347
elif [[ "${account}" == "prod" ]]; then
	account_id=361469336240
fi

# Assume role
if [[ "${account}" == "pci" || "${account}" == "prod" ]]; then
	aws_user="terraform_svc_prod_user"
else
	aws_user="terraform_svc_user"
fi
role="terraform-execution-role"
KST_value=`aws sts assume-role --profile $aws_user --role-arn "arn:aws:iam::$account_id:role/$role" --role-session-name s3_code_deploy --duration-seconds 1800 --query '[Credentials.AccessKeyId,Credentials.SecretAccessKey,Credentials.SessionToken]' --output text`

KST=($KST_value)

# Set the env variables
export AWS_DEFAULT_REGION=us-east-1
export AWS_ACCESS_KEY_ID="${KST[0]}"
export AWS_ACCESS_KEY="${KST[0]}"
export AWS_SECRET_ACCESS_KEY="${KST[1]}"
export AWS_SECRET_KEY="${KST[1]}"
export AWS_SESSION_TOKEN="${KST[2]}"
export AWS_SECURITY_TOKEN="${KST[2]}"
export AWS_DELEGATION_TOKEN="${KST[2]}"

aws sts get-caller-identity

printf "${PURPLE}Account : ${GREEN}$account${NC}\n"
printf "${PURPLE}Bucket Name : ${GREEN}$bucket_name${NC}\n"

cd $ui_path_root

printf "${RED}Emptying the s3 bucket.\n"
aws s3 sync $EMPTY_PATH s3://$bucket_name/ --delete --exact-timestamps --quiet

sleep 5

printf "${GREEN}Pushing the updated code to s3 bucket.\n"
aws s3 sync . s3://$bucket_name/ --delete --exact-timestamps --quiet

if [ $? -eq 0 ]; then
	printf "${PURPLE}Remote Operation Status${NC} : ${GREEN}Success${NC}\n"
else
	printf "${PURPLE}Remote Operation Status${NC} : ${RED}Failure${NC}\n"
	printf "${RED}Please re-execute the action. If the issue is not resolved, contact the administrator.${NC}\n"
	exit 1
fi