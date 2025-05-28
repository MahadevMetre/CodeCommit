#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m'

account=$1
jenkins_user=$BUILD_USER_ID
job_config_file="/opt/scripts/config/terraform_trunk_jobs.json"

build_permission=`jq -r ".\"$account\" | any(index(\"$jenkins_user\"))" "$job_config_file"`

if [[ "$build_permission" != "true" ]];
then
	printf "${PURPLE}Hello ${GREEN}$BUILD_USER${PURPLE}, you are not authorized to build this job.${RED}\n"
	exit 1
else
	plan_only=`jq -r ".\"$account\".plan_only | any(index(\"$jenkins_user\"))" "$job_config_file"`
	if [[ "$plan_only" != "true" ]];
	then
		tf_apply_access="true"
	fi
fi

path=$2
file=$3
testing=$4
aws_user=$5
mfa=$6
# revision=$7
# action=$8
# config_path=$9
# region=${10}
action=$7
config_path=$8
region=${9}

if [[ "${account}" == "Choose One" || "${path}" == "must_change_this" || "${aws_user}" == "Choose One" ]]; then
	printf "${RED}Too lazy to change the default values...?${BLUE}\n"
	exit 1
fi

# Choose us-east-1 as default region
if [[ "${region}" != "us-east-1" && "${region}" != "us-west-2" ]]; then
	region="us-east-1"
fi

# Check region and account combination
if [[ "${region}" == "us-west-2" && "${account}" != "dr" ]]; then
	printf "${RED}Wrong region and account combination.${BLUE}\n"
	exit 1
fi
if [[ "${region}" == "us-east-1" && "${account}" == "dr" ]]; then
	printf "${RED}Wrong region and account combination.${BLUE}\n"
	exit 1
fi

# Choose the right account
if [[ "${account}" == "dev" ]]; then
	account_id=116762271881
elif [[ "${account}" == "qa" ]]; then
	account_id=634621569833
elif [[ "${account}" == "stage" ]]; then
	account_id=702230634984
elif [[ "${account}" == "shared" ]]; then
	account_id=964190570136
elif [[ "${account}" == "dr" ]]; then
	account_id=214946096060
elif [[ "${account}" == "pci" ]]; then
	account_id=601751840347
elif [[ "${account}" == "prod" ]]; then
	account_id=361469336240
fi

# Assume role
if [[ "${aws_user}" == "terraform_svc_user" || "${aws_user}" == "terraform_svc_prod_user" || "${aws_user}" == "terraform_svc_dr_user" ]]; then
	# Additional checks for pci or prod, terraform_svc_prod_user should only be used with pci or prod account
	if [[ "${aws_user}" == "terraform_svc_prod_user" ]]; then
		if [[ "${account}" != "pci" && "${account}" != "prod" ]]; then
			printf "${RED}${aws_user} should only be used with pci or prod account.${BLUE}\n"
			exit 1
		fi
	fi
	# Additional checks for dr, terraform_svc_dr_user should only be used with dr account
	if [[ "${aws_user}" == "terraform_svc_dr_user" && "${account}" != "dr" ]]; then
		printf "${RED}${aws_user} should only be used with dr account.${BLUE}\n"
		exit 1
	fi
	mfa="Not applicable"
	role="terraform-execution-role"
	KST_value=`aws sts assume-role --profile $aws_user --role-arn "arn:aws:iam::$account_id:role/$role" --role-session-name terraform_deploy --duration-seconds 1800 --query '[Credentials.AccessKeyId,Credentials.SecretAccessKey,Credentials.SessionToken]' --output text`
else
	if [[ "${mfa}" != "must_change_this" ]]; then
		if [[ "${account}" == "pci" || "${account}" == "prod" ]]; then
			role="Franklin-Admin"
		else
			role="Franklin-Admin-NonProd"
		fi
		KST_value=`aws sts assume-role --profile $aws_user --role-arn "arn:aws:iam::$account_id:role/$role" --role-session-name terraform_deploy --duration-seconds 1800 --serial-number arn:aws:iam::894891841990:mfa/$aws_user --token-code $mfa --query '[Credentials.AccessKeyId,Credentials.SecretAccessKey,Credentials.SessionToken]' --output text`
	else
		printf "${RED}Too lazy to change the default values...?${BLUE}\n"
		exit 1
	fi
fi

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

aws sts get-caller-identity

# Modify the path per linux structure
path=`echo $path | sed -e 's/\\\/\\//g'`
cutat="${region}/"
if [[ "$path" == *"$cutat"* ]]; then
	path=`echo $path | awk -F $cutat '{print $2}'`
fi
path=${path%/}

# Set config_path to Default if the string doesn't contain key and tfstate
if [[ "$config_path" != *.tfstate* || "$config_path" != *key* ]]; then
	config_path="Default"
fi

printf "${PURPLE}Account : ${GREEN}$account${NC}\n"
printf "${PURPLE}Path : ${GREEN}$path${NC}\n"
printf "${PURPLE}TFVar File : ${GREEN}$file${NC}\n"
printf "${PURPLE}Testing : ${GREEN}$testing${NC}\n"
printf "${PURPLE}User : ${GREEN}$aws_user${NC}\n"
printf "${PURPLE}MFA : ${GREEN}$mfa${NC}\n"
# printf "${PURPLE}Revision : ${GREEN}$revision${NC}\n"
printf "${PURPLE}Action : ${GREEN}$action${NC}\n"
printf "${PURPLE}Config Path : ${GREEN}$config_path${NC}\n"
printf "${PURPLE}Region : ${GREEN}$region${NC}\n"

# Function to update backend config
update_config_path () {
	if [[ "$config_path" != "Default" ]]; then
		line_number=`grep -Fn .tfstate ${backend_file} | cut -d':' -f1`
		sed -i "${line_number}s,.*,$config_path," ${backend_file}
	fi
}

# Commenting out as it is extra functionality
# if [[ "${revision}" != "Latest" ]]; then
	# cd $WORKSPACE/
	# svn update --username $tf_username --password $tf_password -r $revision
# fi

cd $WORKSPACE/Franklin-AWS-Terraform/$region/$path

# Add an extension to file name if var file name is not no_var, exit if file is not found
if [[ "${file}" != "no_var" ]]; then
	temp_file_name=`echo $file | cut -d'.' -f1`
	if [[ -f "${temp_file_name}.tfvars" ]]; then
		file=`echo $file | cut -d'.' -f1`.tfvars
	elif [[ -f "${temp_file_name}.tfvar" ]]; then
		file=`echo $file | cut -d'.' -f1`.tfvar
	elif [[ -f "${temp_file_name}.tf" ]]; then
		file=`echo $file | cut -d'.' -f1`.tf
	else
		printf "${PURPLE}The file ${BLUE}$file ${RED}file does not exist. Exiting the process abnormally.${NC}\n"
		exit 1
	fi
fi

if [[ -f "backend_config.tf" && -f "../backend.tf" && -f "../main.tf" ]]; then
	file=`echo $path | awk -F '/' '{print $(NF)}'`/$file
	cd ..
fi

if [ -f "config.tf" ]; then
	backend_file="config.tf"
	update_config_path
	terraform init
else
	backend_file=`echo $file | rev | cut -d'/' -f2- | rev`/"backend_config.tf"
	if [ ! -f $backend_file ]; then
		printf "${PURPLE}The file ${BLUE}$backend_file ${RED}file does not exist. Exiting the process abnormally.${NC}\n"
		exit 1
	fi
	update_config_path
	terraform init --backend-config="${backend_file}"
fi

printf "${BLUE}\n"
grep bucket ${backend_file}
grep key ${backend_file}
printf "${NC}\n"

terraform validate

# Use tfvar file only if var file name is not no_var
if [[ "${file}" != "no_var" ]]; then
	terraform plan --var-file=$file --input=false
else
	terraform plan --input=false
fi

# Execute the action only if testing boolean value is set to false
if [[ "${testing}" == "false" ]]; then
	# Check if user is authorized to apply the changes
	if [[ "${tf_apply_access}" != "true" ]]; then
		printf "${RED}You are not authorized to apply the changes.\n"
		exit 1
	fi
	# Use tfvar file only if var file name is not no_var
	if [[ "${file}" != "no_var" ]]; then
		terraform $action --var-file=$file --auto-approve
	else
		terraform $action --auto-approve
	fi
else
	# This else block is for terraform destroy planning only
	if [[ "${action}" == "destroy" ]]; then
		# Use tfvar file only if var file name is not no_var
		if [[ "${file}" != "no_var" ]]; then
			terraform destroy --var-file=$file
		else
			terraform destroy
		fi
	exit 0
	fi
fi