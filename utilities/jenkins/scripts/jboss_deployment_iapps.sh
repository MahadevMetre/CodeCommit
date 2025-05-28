#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m'

directory=$1
server_ip=$2
environment=$3
cluster=$4
jobName=$(echo $JOB_NAME|cut -d'/' -f1)

printf "${PURPLE}Workspace${NC} : ${BLUE}$directory${NC}\n"
printf "${PURPLE}Server IP${NC} : ${BLUE}$server_ip${NC}\n"
printf "${PURPLE}Environment${NC} : ${BLUE}$environment${NC}\n"
printf "${PURPLE}Job Name${NC} : ${BLUE}$jobName${NC}\n"

prop_file="$directory/deploy/build.properties"
env_prop_folder="$directory/deploy/config/properties/$environment"

if [ ! -f "$prop_file" ]; then
	printf "${RED}File deploy/build.properties not found. Exiting abnormally.${NC}\n"
	printf "${RED}Try to rebuild the job before you retry.${NC}\n"
	exit 1
fi

if [ ! -d "$env_prop_folder" ]; then
	printf "${RED}Environment specific folder $environment not found under deploy/config/properties/. Exiting abnormally.${NC}\n"
	exit 1
fi

if [[ $jobName == *"trunk"* ]]; then
	jobType=trunk
	if [[ $environment == "devel" || $environment == "qa" || $environment == "staging" ]]; then
		maxBackups=15
	elif [[ $environment == "dr" || $environment == "production" ]]; then
		maxBackups=25
	fi
else
	jobType=branch
	maxBackups=10
fi

ear_path=`grep application.ear.path $prop_file |cut -d'=' -f2`
ear_name=`grep application.ear.name $prop_file |cut -d'=' -f2`
ear_trim_path=$(echo $ear_path | sed -e 's/\r//g')
ear_trim_name=$(echo $ear_name | sed -e 's/\r//g')
application_properties=`grep application.properties.name $prop_file |cut -d'=' -f2`

user_name=`grep $server_ip /opt/scripts/properties/jboss_usernames.props | cut -d'=' -f2`
server_host=`grep $server_ip /opt/scripts/properties/jboss_ips.props | cut -d'=' -f2`

printf "${PURPLE}EAR Path${NC} : ${BLUE}$ear_trim_path${NC}\n"
printf "${PURPLE}EAR Name${NC} : ${BLUE}$ear_trim_name${NC}\n"
printf "${PURPLE}Application Properties${NC} : ${BLUE}$application_properties${NC}\n"
printf "${PURPLE}User Name${NC} : ${BLUE}$user_name${NC}\n"
printf "${PURPLE}Server Host${NC} : ${BLUE}$server_host${NC}\n"

# Deploy to batch cluster if cluster variable equals batch
if [ "$cluster" == "batch" ]; then
	server_group="batchappscluster"
	printf "${PURPLE}Deploying in ${BLUE}batchapps ${PURPLE}cluster.${NC}\n"
fi

cd $directory
printf "${PURPLE}Current path is ${GREEN}`pwd`${NC}\n"
printf "${PURPLE}Starting deployment...${NC}\n"

sshpass -f ~/.id_rsa_cred -P 'Enter passphrase for key' scp $ear_trim_path/$ear_trim_name $user_name@$server_ip:/common/deploy/jboss
if [ $? -eq 0 ]; then
	printf "${PURPLE}EAR File Transfer Status${NC} : ${GREEN}Success${BLUE}\n"
else
	printf "${PURPLE}EAR File Transfer Status${NC} : ${RED}Failure${NC}\n"
	printf "${RED}Please re-execute the action. If the issue is not resolved, contact the administrator.${BLUE}\n"
	exit 1
fi
sshpass -f ~/.id_rsa_cred -P 'Enter passphrase for key' scp $directory/deploy/config/properties/$environment/$application_properties $user_name@$server_ip:/common/deploy/jboss
if [ $? -eq 0 ]; then
	printf "${PURPLE}Properties File Transfer Status${NC} : ${GREEN}Success${NC}\n"
	printf "${GREEN}Starting remote operations${BLUE}\n"
else
	printf "${PURPLE}Properties File Transfer Status${NC} : ${RED}Failure${NC}\n"
	printf "${RED}Please re-execute the action. If the issue is not resolved, contact the administrator.${BLUE}\n"
	exit 1
fi
sshpass -f ~/.id_rsa_cred -P 'Enter passphrase for key' ssh -i ~/.ssh/id_rsa $user_name@$server_ip "
cd /common/deploy/jboss/;
mv $application_properties /common/insuranceapps/etc/$server_host/properties/;
mv $ear_trim_name /opt/web/deployments/$server_host;
cd /opt/web/bin;
./undeploy.sh $ear_trim_name $server_group;
./deploy.sh $ear_trim_name $server_group;
"
if [ $? -eq 0 ]; then
	printf "${PURPLE}Remote Operation Status${NC} : ${GREEN}Success${NC}\n"
	# Backup the ear files as an archive to efs if remote operation is success
	# cd $directory
	# printf "${GREEN}Starting backup activity${NC}\n"
	# printf "${PURPLE}This job is identified as a ${GREEN}$jobType ${PURPLE}job.${NC}\n"
	# printf "${PURPLE}A maximum of ${GREEN}$maxBackups ${PURPLE}ear files will be retained including the current one.${NC}\n"
	# mkdir -p /common/jenkins/ear_backups/${ear_trim_name}/${jobType}/${environment}/
	# tar c --exclude='*.svn*' deploy/ $ear_trim_path/$ear_trim_name | gzip --best > backup_build_${PROMOTED_ID}.tar.gz
	# cp backup_build_${PROMOTED_ID}.tar.gz /common/jenkins/ear_backups/${ear_trim_name}/${jobType}/${environment}/
	# rm backup_build_${PROMOTED_ID}.tar.gz
	# Logic to remove older builds based on maxBackups variable value
	# cd /common/jenkins/ear_backups/${ear_trim_name}/${jobType}/${environment}/
	# result_of_cd=$?
	# if [ $result_of_cd == 0 ]; then
		# printf "${PURPLE}Processing backups inside folder ${GREEN}`pwd`${NC}\n"
		# ls -t backup_*.tar.gz > /dev/null
		# result_of_ls=$?
		# if [ $result_of_ls == 0 ]; then
			# ls -t backup_*.tar.gz | awk "NR>${maxBackups}" | xargs rm -f
			# printf "${PURPLE}Removed older backups.${NC}\n"
		# else
			# printf "${RED}No files to remove.${NC}\n"
		# fi
		# printf "${GREEN}Backup completed successfully.${NC}\n"
	# else
		# printf "${RED}Cannot cd to ${PURPLE}/common/jenkins/ear_backups/${ear_trim_name}/${jobType}/${environment}/${NC}\n"
		# printf "${RED}Backup failed.${NC}\n"
	# fi
	# End of Backup logic
else
	printf "${PURPLE}Remote Operation Status${NC} : ${RED}Failure${NC}\n"
	printf "${RED}Please re-execute the action. If the issue is not resolved, contact the administrator.${NC}\n"
	exit 1
fi