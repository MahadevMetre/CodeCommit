#!/bin/bash

user_name=$BUILD_USER_ID 
password=$1

if [[ $password == "default" ]]; then
	echo "Please change the default password and rebuild the job."
	exit 1
else
	sudo htpasswd -b -m /etc/apache2/dav_svn.passwd $user_name $password
	echo "Success. Please contact the administrator to get access to repos."
fi