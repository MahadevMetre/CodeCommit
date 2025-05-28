#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m'

array[0]="RED"
array[1]="GREEN"
array[2]="PURPLE"
array[3]="BLUE"
array_size=${#array[@]}

jenkins_user=$BUILD_USER_ID

remote_user=$1
server=$2
server_ip=$3
environment=$4

if [[ "${jenkins_user}" == "apilla" || "${jenkins_user}" == "ksenkodi" || "${jenkins_user}" == "sbose" || "${jenkins_user}" == "mfaizudeen" ]]; then
	if [[ "${jenkins_user}" == "sbose" || "${jenkins_user}" == "mfaizudeen" ]]; then
		if [[ "${environment}" == "pci" || "${environment}" == "dr" ]]; then
			printf "${PURPLE}Hey there ${GREEN}$BUILD_USER${PURPLE}, you are not allowed to perform this action.${RED}\n"
			printf "Please reach out to admin for assistance.\n"
			exit 1
		fi
	fi
else
	printf "${PURPLE}Hey there ${GREEN}$BUILD_USER${PURPLE}, you are not allowed to perform this action.${RED}\n"
	printf "Please reach out to admin for assistance.\n"
	exit 1
fi

if [[ "${server}" == "insurancejb" ]]; then
	cert_file=/common/deploy/fullchain.pem
	key_file=/common/deploy/privkey.pem
	alias=franklinmadisonds
elif [[ "${server}" == "insuranceapps" ]]; then
	cert_file=/common/deploy/ssl/fmds_cert.pem
	key_file=/common/deploy/ssl/fmds_key.pem
	alias=franklinmadisonds
elif [[ "${server}" == "digital" ]]; then
	cert_file=/common/deploy/ssl/fmservice_cert.pem
	key_file=/common/deploy/ssl/fmservice_key.pem
	alias=fmservice
fi

index=$(($RANDOM % $array_size))
color=${array[$index]}
printf "${!color}"

sshpass -f ~/.id_rsa_cred -P 'Enter passphrase for key' ssh -i ~/.ssh/id_rsa $remote_user@$server_ip "
sshpass -f ~/.id_rsa_cred -P 'password for $remote_user:' sudo cp $cert_file /opt/web/JBDomainBuilder/JavaKeyStore/identity/$alias.cer;
sshpass -f ~/.id_rsa_cred -P 'password for $remote_user:' sudo cp $key_file /opt/web/JBDomainBuilder/JavaKeyStore/privkey/$alias.pem;
sshpass -f ~/.id_rsa_cred -P 'password for $remote_user:' sudo su - jbadmin -c '/opt/web/bin/certupdate.sh $alias'"

if [[ "${server}" == "insurancejb" ]]; then
	sshpass -f ~/.id_rsa_cred -P 'Enter passphrase for key' ssh -i ~/.ssh/id_rsa $remote_user@$server_ip "
	sshpass -f ~/.id_rsa_cred -P 'password for $remote_user:' sudo su - jbadmin -c 'cp /opt/web/JBDomainBuilder/JavaKeyStore/jks/servercert.jks /common/apps/projects/insurancejb/configuration/servercert.jks'"
else
	sshpass -f ~/.id_rsa_cred -P 'Enter passphrase for key' ssh -i ~/.ssh/id_rsa $remote_user@$server_ip "
	sshpass -f ~/.id_rsa_cred -P 'password for $remote_user:' sudo su - jbadmin -c 'cp /opt/web/JBDomainBuilder/JavaKeyStore/jks/servercert.jks /common/apps/admin/configuration/servercert.jks';
	sshpass -f ~/.id_rsa_cred -P 'password for $remote_user:' sudo su - jbadmin -c 'cp /opt/web/JBDomainBuilder/JavaKeyStore/jks/servercert.jks /common/apps/batchapps/configuration/servercert.jks';
	sshpass -f ~/.id_rsa_cred -P 'password for $remote_user:' sudo su - jbadmin -c 'cp /opt/web/JBDomainBuilder/JavaKeyStore/jks/servercert.jks /common/apps/insuranceapps/configuration/servercert.jks'"
fi

index=$(($RANDOM % $array_size))
color=${array[$index]}
printf "${!color}"

# Schedule a restart after 1 minute
sshpass -f ~/.id_rsa_cred -P 'Enter passphrase for key' ssh -i ~/.ssh/id_rsa $remote_user@$server_ip "
sshpass -f ~/.id_rsa_cred -P 'password for $remote_user:' sudo shutdown -r 1"
printf "${ORANGE}----------------------------------------<><><><><><><><><><>----------------------------------------${NC}\n"