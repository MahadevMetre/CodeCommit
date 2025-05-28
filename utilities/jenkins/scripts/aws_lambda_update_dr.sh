#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m'

account=$1
function_name=$2
file_name=$3
folder_name=$4

# Choose the right account
if [[ "${account}" == "dr" ]]; then
	account_id=214946096060
fi

# Assume role
if [[ "${account}" != "pci" ]]; then
	aws_user="terraform_svc_dr_user"
else
	aws_user="terraform_svc_prod_user"
fi
role="terraform-execution-role"
KST_value=`aws sts assume-role --profile $aws_user --role-arn "arn:aws:iam::$account_id:role/$role" --role-session-name lambda_deploy --duration-seconds 1800 --query '[Credentials.AccessKeyId,Credentials.SecretAccessKey,Credentials.SessionToken]' --output text`

KST=($KST_value)

# Set the env variables
export AWS_DEFAULT_REGION=us-west-2
export AWS_ACCESS_KEY_ID="${KST[0]}"
export AWS_ACCESS_KEY="${KST[0]}"
export AWS_SECRET_ACCESS_KEY="${KST[1]}"
export AWS_SECRET_KEY="${KST[1]}"
export AWS_SESSION_TOKEN="${KST[2]}"
export AWS_SECURITY_TOKEN="${KST[2]}"
export AWS_DELEGATION_TOKEN="${KST[2]}"

aws sts get-caller-identity

printf "${PURPLE}Account : ${GREEN}$account${NC}\n"
printf "${PURPLE}Function Name : ${GREEN}$function_name${GREEN}\n"

cd $folder_name

if [[ ! -f "$file_name" ]]; then
	printf "${RED}File ${GREEN}$file_name ${RED}not found in the current directory.${NC}\n"
	exit 1
fi

aws lambda update-function-code --function-name $function_name --zip-file fileb://$file_name

if [ $? -eq 0 ]; then
	printf "${PURPLE}Remote Operation Status${NC} : ${GREEN}Success${NC}\n"
else
	printf "${PURPLE}Remote Operation Status${NC} : ${RED}Failure${NC}\n"
	printf "${RED}Please re-execute the action. If the issue is not resolved, contact the administrator.${NC}\n"
	exit 1
fi