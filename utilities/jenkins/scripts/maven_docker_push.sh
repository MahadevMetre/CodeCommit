#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m'

aws_account_id=${1}
aws_environment=${2}

if [[ "$aws_environment" == "dr" ]];
then
	region="us-west-2"
else
	region="us-east-1"
fi

aws_profile=${3}
application_name=${4}-${aws_environment}
docker_file_name=${5}
repo_name=fmg-insuranceapps
repo_url=${aws_account_id}.dkr.ecr.${region}.amazonaws.com/${repo_name}
working_dir=/common/jenkins/promoted_builds
deploy_folder=deploy

cd $working_dir/$PROMOTED_JOB_NAME/$PROMOTED_NUMBER/$aws_environment

if [[ ! -d "$deploy_folder" ]]; then
	printf "${RED}The folder ${PURPLE}$deploy_folder${RED} is not found. ${PURPLE}Exiting the script${RED}.\n"
	exit 1
fi

cp -ar $deploy_folder/* .

export DOCKER_BUILDKIT=1
docker build -t ${application_name} -f ${docker_file_name} .

docker tag ${application_name}:latest ${repo_url}:${application_name}

aws --profile ${aws_profile} ecr get-login-password | docker login --username AWS --password-stdin ${aws_account_id}.dkr.ecr.${region}.amazonaws.com
aws --profile ${aws_profile} ecr batch-delete-image --repository-name ${repo_name} --image-ids imageTag=${application_name}
docker push ${repo_url}:${application_name}
# docker rmi $(docker images | grep "<none>" | awk {'print $3'})