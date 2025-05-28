#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m'

mvn_cmd=$1
ws_sub=$2
my_dir=$WORKSPACE/$ws_sub
my_backup_path=$BACKUP_PATH_BUILD/$ws_sub

cd $my_dir
mvn $mvn_cmd
status_code=$?
if [ $status_code -ne 0 ]; then
	printf "${RED}The command ${PURPLE}mvn $mvn_cmd${RED} exited with error code ${PURPLE}$status_code${RED}.\n"
	rm -rf $WORKSPACE/
	exit 1
fi
mkdir -p $my_backup_path
cp -ar ${my_dir}*-ear $my_backup_path
cp -ar ${my_dir}deploy $my_backup_path
rm -rf ${my_dir}
cd ${my_backup_path}*-ear || exit 1
shopt -s extglob && sleep 1
rm -rf !(target) && cd target && sleep 4 || exit 1
rm -rf !(*.ear)
shopt -u extglob