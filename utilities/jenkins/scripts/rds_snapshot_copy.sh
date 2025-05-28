#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m'

array[0]="RED"
array[1]="GREEN"
array[2]="ORANGE"
array[3]="BLUE"
array_size=${#array[@]}

today=`date "+%m%d%Y"`
source_account_id=361469336240
destination_account_id=214946096060
source_db_name=rds-pg-fmg-serverless-prod
source_snapshot_name=${source_db_name}-snapshot-${today}
source_account_west2_snapshot_name=${source_snapshot_name}-west-2
destination_account_west2_snapshot_name=${source_snapshot_name}-west-2
source_account_west2_kms_id=e3e641bd-e32e-41d2-ba3f-cd1015721f52
destination_account_west2_kms_id=f4e6882f-cfde-4e27-87d5-718eaaeb574c

Account=prod
aws_user=terraform_svc_prod_user
KST_value=`aws sts assume-role --profile $aws_user --role-arn "arn:aws:iam::$source_account_id:role/terraform-execution-role" --role-session-name terraform_deploy --duration-seconds 1800 --query '[Credentials.AccessKeyId,Credentials.SecretAccessKey,Credentials.SessionToken]' --output text`
KST=($KST_value)
export AWS_DEFAULT_REGION="us-east-1"
export AWS_ACCESS_KEY_ID="${KST[0]}"
export AWS_ACCESS_KEY="${KST[0]}"
export AWS_SECRET_ACCESS_KEY="${KST[1]}"
export AWS_SECRET_KEY="${KST[1]}"
export AWS_SESSION_TOKEN="${KST[2]}"
export AWS_SECURITY_TOKEN="${KST[2]}"
export AWS_DELEGATION_TOKEN="${KST[2]}"

# Create snapshot in source account
printf "${PURPLE}Creating snapshot ${GREEN}$source_snapshot_name${PURPLE} for the db ${GREEN}$source_db_name${PURPLE} in ${GREEN}$Account${PURPLE} account.${BLUE}\n"
aws rds create-db-snapshot --db-snapshot-identifier $source_snapshot_name --db-instance-identifier $source_db_name

# Wait till snapshot is available
source_snapshot_status=creating
source_snapshot_arn=`aws rds describe-db-snapshots --db-snapshot-identifier $source_snapshot_name | jq -r '.DBSnapshots[].DBSnapshotArn'`
while [ "$source_snapshot_status" != "available" ];
do
	sleep 30
	source_snapshot_status=`aws rds describe-db-snapshots --db-snapshot-identifier $source_snapshot_name | jq -r '.DBSnapshots[].Status'`
	index=$(($RANDOM % $array_size))
	color=${array[$index]}
	printf "${PURPLE}Snapshot creation status: ${!color}$source_snapshot_status${NC}\n"
done

# Copy the snapshot to the same account us-west-2 region encrypted with the kms in us-west-2
export AWS_DEFAULT_REGION="us-west-2"
printf "${PURPLE}Copying snapshot ${GREEN}$source_snapshot_name${PURPLE} to ${GREEN}$AWS_DEFAULT_REGION${PURPLE} as ${GREEN}$source_account_west2_snapshot_name${PURPLE} encrypted with the kms key id ${GREEN}$source_account_west2_kms_id.${BLUE}\n"
aws rds copy-db-snapshot --source-db-snapshot-identifier $source_snapshot_arn --target-db-snapshot-identifier $source_account_west2_snapshot_name --kms-key-id $source_account_west2_kms_id --source-region us-east-1

# Wait till snapshot is available
source_snapshot_copy_status=creating
while [ "$source_snapshot_copy_status" != "available" ];
do
	sleep 30
	source_snapshot_copy_status=`aws rds describe-db-snapshots --db-snapshot-identifier $source_account_west2_snapshot_name | jq -r '.DBSnapshots[].Status'`
	index=$(($RANDOM % $array_size))
	color=${array[$index]}
	printf "${PURPLE}Snapshot copy status: ${!color}$source_snapshot_copy_status${NC}\n"
done

# Share the snapshot to the destination account us-west-2 region
Account=dr
printf "${PURPLE}Sharing snapshot ${GREEN}$source_account_west2_snapshot_name${PURPLE} to ${GREEN}$Account${PURPLE} account encrypted with the kms key id ${GREEN}$source_account_west2_kms_id.${BLUE}\n"
aws rds modify-db-snapshot-attribute --db-snapshot-identifier $source_account_west2_snapshot_name --attribute-name restore --values-to-add $destination_account_id

shared_snapshot_arn=`aws rds describe-db-snapshots --db-snapshot-identifier $source_account_west2_snapshot_name | jq -r '.DBSnapshots[].DBSnapshotArn'`

aws_user=terraform_svc_dr_user
# export AWS_DEFAULT_REGION="us-east-1"
KST_value=`aws sts assume-role --profile $aws_user --role-arn "arn:aws:iam::$destination_account_id:role/terraform-execution-role" --role-session-name terraform_deploy --duration-seconds 1800 --query '[Credentials.AccessKeyId,Credentials.SecretAccessKey,Credentials.SessionToken]' --output text`
KST=($KST_value)
export AWS_DEFAULT_REGION="us-west-2"
export AWS_ACCESS_KEY_ID="${KST[0]}"
export AWS_ACCESS_KEY="${KST[0]}"
export AWS_SECRET_ACCESS_KEY="${KST[1]}"
export AWS_SECRET_KEY="${KST[1]}"
export AWS_SESSION_TOKEN="${KST[2]}"
export AWS_SECURITY_TOKEN="${KST[2]}"
export AWS_DELEGATION_TOKEN="${KST[2]}"

# Copy the snapshot to the same account us-west-2 region encrypted with the kms in us-west-2
printf "${PURPLE}Copying snapshot ${GREEN}$source_account_west2_snapshot_name${PURPLE} to ${GREEN}$AWS_DEFAULT_REGION${PURPLE} encrypted with the kms key id ${GREEN}$destination_account_west2_kms_id.${BLUE}\n"
aws rds copy-db-snapshot --source-db-snapshot-identifier $shared_snapshot_arn --target-db-snapshot-identifier $destination_account_west2_snapshot_name --kms-key-id $destination_account_west2_kms_id --source-region us-west-2

# Wait till snapshot is available
destination_snapshot_copy_status=creating
while [ "$destination_snapshot_copy_status" != "available" ];
do
	sleep 30
	destination_snapshot_copy_status=`aws rds describe-db-snapshots --db-snapshot-identifier $destination_account_west2_snapshot_name | jq -r '.DBSnapshots[].Status'`
	index=$(($RANDOM % $array_size))
	color=${array[$index]}
	printf "${PURPLE}Snapshot copy status: ${!color}$destination_snapshot_copy_status${NC}\n"
done