#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m'

environment=$1
ws_sub=$2
my_dir=$WORKSPACE/$ws_sub
my_backup_path=$BACKUP_PATH_BUILD/$ws_sub
deploy_folder=deploy

cd $my_dir

if [[ ! -d "$deploy_folder" ]]; then
	printf "${RED}The folder ${PURPLE}$deploy_folder${RED} is not found. ${PURPLE}Exiting the script${RED}.\n"
	exit 1
fi

rm -rf .svn

environment=dev
env_backup_path=$my_backup_path/$environment
mkdir -p $env_backup_path
cp -ar * $env_backup_path

environment=qa
env_backup_path=$my_backup_path/$environment
mkdir -p $env_backup_path
cp -ar * $env_backup_path

environment=stage
env_backup_path=$my_backup_path/$environment
mkdir -p $env_backup_path
cp -ar * $env_backup_path

environment=prod
env_backup_path=$my_backup_path/$environment
mkdir -p $env_backup_path
cp -ar * $env_backup_path

environment=dr
env_backup_path=$my_backup_path/$environment
mkdir -p $env_backup_path
cp -ar * $env_backup_path

rm -rf $my_dir