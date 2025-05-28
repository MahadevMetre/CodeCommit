#!/bin/bash

aws_profile=${1}
cluster_name=${2}
service_name=${3}
action=${4}

if [[ "$action" == "refresh" ]];
then
	aws --profile $aws_profile ecs update-service --cluster $cluster_name --service $service_name --force-new-deployment
elif [[ "$action" == "restart" ]];
then
	desired_count=`aws --profile $aws_profile ecs describe-services --cluster $cluster_name --services $service_name | \
	jq -r ".services[] | select(.serviceName == \"$service_name\") | .desiredCount"`
	aws --profile $aws_profile ecs update-service --cluster $cluster_name --service $service_name --desired-count 0
	sleep 30
	aws --profile $aws_profile ecs update-service --cluster $cluster_name --service $service_name --desired-count $desired_count --force-new-deployment
fi