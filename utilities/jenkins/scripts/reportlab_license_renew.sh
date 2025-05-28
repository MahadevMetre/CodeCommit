#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m'

jenkins_user=$BUILD_USER_ID
job_config_file="/opt/scripts/config/reportlab_job.json"

build_permission=`jq -r ".build | any(index(\"$jenkins_user\"))" "$job_config_file"`

if [[ "$build_permission" != "true" ]];
then
	printf "${PURPLE}Hello ${GREEN}$BUILD_USER${PURPLE}, you are not authorized to build this job.${RED}\n"
	exit 1
fi

renewal_month=$1
renewal_year=$2

current_year=`date +%Y`
current_month=`date +%B`

if [[ $current_year != $renewal_year || $current_month != $renewal_month ]]; then
	printf "${PURPLE}You can build this job only during ${GREEN}$renewal_month $renewal_year.${NC}\n"
	exit 1
fi

# Fetch the license and print details
cd /home/jenkins/reportlab_license_check/
sshpass -f ~/.id_rsa_cred -P 'Enter passphrase for key' scp gitlab@10.153.30.20:/common/reportlab/ReportLabPLUSLicense.py ReportLabPLUSLicense_new.py
if [[ ! -f "ReportLabPLUSLicense_new.py" ]];
then
	printf "${RED}Error fetching license file from the source.\n"
	exit 1
fi
touch ReportLabPLUSLicense.py
mv ReportLabPLUSLicense.py ReportLabPLUSLicense_old.py
mv ReportLabPLUSLicense_new.py ReportLabPLUSLicense.py
printf "${GREEN}"
python check_reportlab_license.py
printf "${NC}"
rm ReportLabPLUSLicense.py
mv ReportLabPLUSLicense_old.py ReportLabPLUSLicense.py
cd $WORKSPACE

# Start the renewal process
printf "${PURPLE}Renewing reportlab license in ${GREEN}10.153.30.22${BLUE}\n"

sshpass -f ~/.id_rsa_cred -P 'Enter passphrase for key' ssh -i ~/.ssh/id_rsa gitlab@10.153.30.22 "
sshpass -f ~/.id_rsa_cred -P 'password for gitlab:' sudo cp /common/reportlab/ReportLabPLUSLicense.py /usr/local/lib/python3.8/site-packages/ReportLabPLUSLicense.py;
sshpass -f ~/.id_rsa_cred -P 'password for gitlab:' sudo systemctl stop pycharm;
sshpass -f ~/.id_rsa_cred -P 'password for gitlab:' sudo systemctl stop nginx;
sshpass -f ~/.id_rsa_cred -P 'password for gitlab:' sudo systemctl start pycharm;
sshpass -f ~/.id_rsa_cred -P 'password for gitlab:' sudo systemctl start nginx;
"

if [ $? -eq 0 ]; then
	printf "${PURPLE}Remote Operation Status${NC} : ${GREEN}Success${NC}\n"
else
	printf "${PURPLE}Remote Operation Status${NC} : ${RED}Failure${NC}\n"
	exit 1
fi

printf "${PURPLE}Renewing reportlab license in ${GREEN}10.153.31.22${BLUE}\n"

sshpass -f ~/.id_rsa_cred -P 'Enter passphrase for key' ssh -i ~/.ssh/id_rsa gitlab@10.153.31.22 "
sshpass -f ~/.id_rsa_cred -P 'password for gitlab:' sudo cp /common/reportlab/ReportLabPLUSLicense.py /usr/local/lib/python3.8/site-packages/ReportLabPLUSLicense.py;
sshpass -f ~/.id_rsa_cred -P 'password for gitlab:' sudo systemctl stop pycharm;
sshpass -f ~/.id_rsa_cred -P 'password for gitlab:' sudo systemctl stop nginx;
sshpass -f ~/.id_rsa_cred -P 'password for gitlab:' sudo systemctl start pycharm;
sshpass -f ~/.id_rsa_cred -P 'password for gitlab:' sudo systemctl start nginx;
"

if [ $? -eq 0 ]; then
	printf "${PURPLE}Remote Operation Status${NC} : ${GREEN}Success${NC}\n"
	sshpass -f ~/.id_rsa_cred -P 'Enter passphrase for key' ssh -i ~/.ssh/id_rsa gitlab@10.153.30.22 "
	cd /common/reportlab/;
	sshpass -f ~/.id_rsa_cred -P 'password for gitlab:' sudo rm -f ReportLabPLUSLicense.py;
	"
	if [ $? -eq 0 ]; then
		printf "${GREEN}License file removed from /common/reportlab/${NC}\n"
	else
		printf "${RED}Cannot remove license file from /common/reportlab/${NC}\n"
	fi
else
	printf "${PURPLE}Remote Operation Status${NC} : ${RED}Failure${NC}\n"
	exit 1
fi