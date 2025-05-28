#!/bin/bash

if [[ "${BUILD_USER_ID}" != "timer" ]]; then
	echo "Hey there $BUILD_USER, you are not allowed to perform this action."
	echo "Please reach out to admin for assistance."
	exit 1
fi

environment=$1
action=$2

hour=`date +%H`
aws_profile="jenkins_ec2_management_user_$environment"
ec2_list="properties/ec2_list_$environment.txt"
asg_list="properties/asg_list_$environment.txt"

# Start instance if 5.30 AM CST, else Stop
if [ "$hour" == "05" ]; then
	ec2_action="start-instances"
	asg_capacity="--min-size 1 --desired-capacity 1"
else
	ec2_action="stop-instances"
	asg_capacity="--min-size 0 --desired-capacity 0"
fi

# Check if action is overridden
if [ "$action" == "start" ]; then
	ec2_action="start-instances"
	asg_capacity="--min-size 1 --desired-capacity 1"
elif [ "$action" == "stop" ]; then
	ec2_action="stop-instances"
	asg_capacity="--min-size 0 --desired-capacity 0"
fi

# Instance action
while read -r line
do
	aws --profile $aws_profile ec2 $ec2_action --instance-ids $line
done < $ec2_list

# ASG action
while read -r line
do
	aws --profile $aws_profile autoscaling update-auto-scaling-group --auto-scaling-group-name $line $asg_capacity
done < $asg_list