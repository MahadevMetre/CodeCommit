#!/bin/bash

# Script to toggle dusty page
# Usage : ./scriptname.sh enable/disable
# Eg : ./dusty_page.sh enable

# Get the action variable
action=$1

fmservice_config=digital_public_pci.conf
fmservice_config_disabled="$fmservice_config"_disabled
fmservice_dusty=digital_public_dusty.conf
fmservice_dusty_disabled="$fmservice_dusty"_disabled

if [[ "${action}" != "enable" && "${action}" != "disable" ]]; then
	echo "Invalid parameter passed."
	echo "Usage : ${0} enable/disable"
	exit 1
fi

# Change directory to nginx config location
cd /common/nginx/sites-enabled/

if [[ "${action}" == "enable" ]]; then
	if [[ -f $fmservice_dusty || -f $fmservice_config_disabled ]]; then
		echo "Dusty page is already enabled."
	else
		mv $fmservice_config $fmservice_config_disabled
		mv $fmservice_dusty_disabled $fmservice_dusty
		echo "Dusty page is enabled."
	fi
elif [[ "${action}" == "disable" ]]; then
	if [[ -f $fmservice_config || -f $fmservice_dusty_disabled ]]; then
		echo "Dusty page is already disabled."
	else
		mv $fmservice_dusty $fmservice_dusty_disabled
		mv $fmservice_config_disabled $fmservice_config
		echo "Dusty page is disabled."
	fi
fi

# Reload nginx config
systemctl reload nginx
ls -lrth /common/nginx/sites-enabled/
echo "Make sure you run the enable / disable script in all the autoscaled instances."