#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m'

jenkins_user=$BUILD_USER_ID
job_config_file="/opt/scripts/config/cert_update_job.json"

build_permission=`jq -r ".build | any(index(\"$jenkins_user\"))" "$job_config_file"`

if [[ "$build_permission" != "true" ]];
then
	printf "${PURPLE}Hello ${GREEN}$BUILD_USER${PURPLE}, you are not authorized to build this job.${RED}\n"
	exit 1
fi

# Set the env variables for aws access
# The file /home/jenkins/.certbot_cred has access key and secret key of user certbot_acme from franklin-shared account
export AWS_ACCESS_KEY_ID=`head -1 /home/jenkins/.certbot_cred`
export AWS_SECRET_ACCESS_KEY=`tail -1 /home/jenkins/.certbot_cred`

# Cert Generation
# certbot certonly -d *.franklinmadisonds.com --dns-route53 --logs-dir /home/jenkins/letsencrypt/log/ --config-dir /home/jenkins/letsencrypt/config/ --work-dir /home/jenkins/letsencrypt/work/ -m insurance_sys_aws@franklin-madison.com --agree-tos --non-interactive --server https://acme-v02.api.letsencrypt.org/directory
# certbot certonly -d *.fmservice.com --dns-route53 --logs-dir /home/jenkins/letsencrypt/log/ --config-dir /home/jenkins/letsencrypt/config/ --work-dir /home/jenkins/letsencrypt/work/ -m insurance_sys_aws@franklin-madison.com --agree-tos --non-interactive --server https://acme-v02.api.letsencrypt.org/directory

# Cert Renewal
certbot renew --force-renewal --dns-route53 --logs-dir /home/jenkins/letsencrypt/log/ --config-dir /home/jenkins/letsencrypt/config/ --work-dir /home/jenkins/letsencrypt/work/ --non-interactive --server https://acme-v02.api.letsencrypt.org/directory