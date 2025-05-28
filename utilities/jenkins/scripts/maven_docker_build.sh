#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m'

mvn_cmd=$1
target_path=$2
environments=$3
ws_sub=$4
my_dir=$WORKSPACE/$ws_sub
my_backup_path=$BACKUP_PATH_BUILD/$ws_sub
deploy_folder=deploy

target_dir=`dirname $target_path`
target_file=`echo $target_path | awk -F/ '{print $NF}'`

cd $my_dir

if [[ ! -d "$deploy_folder" ]]; then
	printf "${RED}The folder ${PURPLE}$deploy_folder${RED} is not found. ${PURPLE}Exiting the script${RED}.\n"
	exit 1
fi

env_count=`echo $environments | wc -w`

for (( i = 1; i <= $env_count; i++ ))
do
	current_env=`echo $environments | cut -d' ' -f$i`
	env_backup_path=$my_backup_path/$current_env/$target_dir
	printf "${PURPLE}Started maven build for environment : ${GREEN}$current_env${NC}\n"
	mvn -Dactive.profile=$current_env $mvn_cmd
	status_code=$?
	if [ $status_code -ne 0 ]; then
		printf "${RED}The command ${PURPLE}mvn $mvn_cmd${RED} exited with error code ${PURPLE}$status_code${RED}.\n"
		rm -rf $WORKSPACE/
		rm -rf $env_backup_path/
		exit 1
	fi
	if [[ ! -f "$target_path" ]]; then
		printf "${RED}The file ${PURPLE}$target_path${RED} is not found. ${PURPLE}Exiting the script${RED}.\n"
		exit 1
	fi
	mkdir -p $env_backup_path
	cp $target_path $env_backup_path/$target_file
	cp -ar $deploy_folder $my_backup_path/$current_env/
	rm -f $target_path
	printf "${PURPLE}Completed maven build for environment : ${GREEN}$current_env${NC}\n"
done

rm -rf $my_dir