#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m'

if [ $# -eq 4 ]; then
	dev_env=false
else
	dev_env=true
fi

workspace=$1
zip_file=$2
server_ip=$3
server2_ip=$4

if [ "$server_ip" == "10.153.14.22" ]; then
	pycharm_env=dev
elif [ "$server_ip" == "10.153.18.22" ]; then
	pycharm_env=stage
elif [ "$server_ip" == "10.153.30.22" ]; then
	pycharm_env=prod
elif [ "$server_ip" == "10.153.42.22" ]; then
	pycharm_env=dr
fi

if [ ! -f "$workspace/$zip_file" ]; then
	printf "${RED}File $workspace/$zip_file not found. Exiting abnormally.${NC}\n"
	exit 1
fi

sshpass -f ~/.id_rsa_cred -P 'Enter passphrase for key' scp $workspace/$zip_file gitlab@$server_ip:/common/deploy/pycharm/

printf "${PURPLE}Starting deployment to server ${GREEN}$server_ip${NC}\n"
sshpass -f ~/.id_rsa_cred -P 'Enter passphrase for key' ssh -i ~/.ssh/id_rsa gitlab@$server_ip "
sshpass -f ~/.id_rsa_cred -P 'password for gitlab:' sudo -H -u pycharm bash -c '
cd /opt/pycharm/
cp /common/deploy/pycharm/$zip_file /opt/pycharm/
rm -rf src
tar xf $zip_file
rm -rf $zip_file
cd src/batch/pycharm/utils
sed -i \"s/PYCHARM_ENV = localhost/PYCHARM_ENV = $pycharm_env/g\" config.ini'
sshpass -f ~/.id_rsa_cred -P 'password for gitlab:' sudo systemctl restart pycharm;
sshpass -f ~/.id_rsa_cred -P 'password for gitlab:' sudo service nginx restart"

if [ "$dev_env" == "false" ]; then
	printf "${PURPLE}Starting deployment to server ${GREEN}$server2_ip${NC}\n"
	sshpass -f ~/.id_rsa_cred -P 'Enter passphrase for key' ssh -i ~/.ssh/id_rsa gitlab@$server2_ip "
	sshpass -f ~/.id_rsa_cred -P 'password for gitlab:' sudo -H -u pycharm bash -c '
	cd /opt/pycharm/
	cp /common/deploy/pycharm/$zip_file /opt/pycharm/
	rm -rf src
	tar xf $zip_file
	rm -rf $zip_file
	cd src/batch/pycharm/utils
	sed -i 's/server1/server2/g' config.ini
	sed -i \"s/PYCHARM_ENV = localhost/PYCHARM_ENV = $pycharm_env/g\" config.ini'
	sshpass -f ~/.id_rsa_cred -P 'password for gitlab:' sudo systemctl restart pycharm;
	sshpass -f ~/.id_rsa_cred -P 'password for gitlab:' sudo service nginx restart"
fi