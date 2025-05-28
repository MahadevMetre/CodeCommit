#!/bin/bash

cd $WORKSPACE

sonar_prop_file=sonar-project.properties

if [ ! -f "$sonar_prop_file" ]; then
	echo $sonar_prop_file file not found
	echo Setup the $sonar_prop_file before reaching out to CLOPSUPPORT
	echo Refer the file https://svn.franklinmadisonds.com/svn/insurance/ui/insuranceapps/hermes_serverless/branches/print_sprint-2/sonar-project.properties
	exit 1
fi

lcov_path=`grep 'sonar.javascript.lcov.reportPaths=' $sonar_prop_file | cut -d'=' -f2`

grep -q '"sonar-test"' package.json
if [ $? -ne 0 ]; then
	echo sonar-test script not found in package.json
	echo Configure the package.json before reaching out to CLOPSUPPORT
	echo Refer the file https://svn.franklinmadisonds.com/svn/insurance/ui/insuranceapps/hermes_serverless/branches/print_sprint-2/package.json
	exit 1
fi

npm install
npm run sonar-test

if [ ! -f "$lcov_path" ]; then
	echo $lcov_path file not found
	echo Configure the karma.conf.js before reaching out to CLOPSUPPORT
	echo Refer the file https://svn.franklinmadisonds.com/svn/insurance/ui/insuranceapps/hermes_serverless/branches/print_sprint-2/karma.conf.js
	exit 1
fi

sonar-scanner -Dsonar.host.url=$SONARQUBE_URL -Dsonar.login=$SONARQUBE_AUTH_TOKEN