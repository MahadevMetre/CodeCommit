#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m'

enable_scan="true"
enable_quality_gate="false"

if [[ "${enable_scan}" == "false" ]]; then
	printf "${BLUE}****************************************************\n"
	printf "${PURPLE}Sonar scanner is disabled globally in the script.\nSkipping quality checks.\n"
	printf "${BLUE}****************************************************${NC}\n"
	exit 0
fi

enable_quality_gate="$1"
mvn_cmd="$2"
proj_name="$3"
proj_key="$4"
ws_sub="$5"
my_dir="$WORKSPACE/$ws_sub"

cd $my_dir

printf "${BLUE}****************************************************${NC}\n"
printf "${PURPLE}Starting sonar code quality analysis....${NC}\n"

mvn $mvn_cmd -Dsonar.login=$SONARQUBE_AUTH_TOKEN -Dsonar.host.url=$SONARQUBE_URL -Dsonar.projectName="${proj_name}" -Dsonar.projectKey="${proj_key}"

status_code=$?
if [ $status_code -ne 0 ]; then
	printf "${RED}The command ${PURPLE}mvn $mvn_cmd${RED} exited with error code ${PURPLE}$status_code${RED}.\n"
	printf "${BLUE}****************************************************${RED}\n"
	exit 1
fi

printf "${GREEN}Sonar code quality analysis completed successfully.${NC}\n"
printf "${PURPLE}Fetching quality gate status...${NC}\n"

sleep 5

qGateStatus=`curl -s -u $SONARQUBE_AUTH_TOKEN: $SONARQUBE_URL/api/qualitygates/project_status?projectKey=${proj_key} | jq -r '.projectStatus.status'`

printf "${PURPLE}Quality gate status : ${GREEN}$qGateStatus\n${NC}"

if [[ "${enable_quality_gate}" != "true" ]]; then
	printf "${PURPLE}Quality gate restriction is disabled for this job.\n"
	printf "${BLUE}****************************************************${NC}\n"
	exit 0
fi

if [[ "${qGateStatus}" != "OK" ]]; then
	printf "${RED}Sorry, your code did not pass the quality check.\n"
	printf "${BLUE}View the detailed report at ${SONARQUBE_URL}/dashboard?id=${proj_key}\n${RED}"
	printf "${PURPLE}Please fix the issues and retrigger the build.\n${RED}"
	printf "${BLUE}****************************************************${RED}\n"
	exit 1
fi
printf "${BLUE}****************************************************${NC}\n"
