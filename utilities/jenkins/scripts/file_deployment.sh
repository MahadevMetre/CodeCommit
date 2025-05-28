#!/bin/sh

# Author : Vaitheeswaran Giriraj
# Date : 18-03-2020
# Script follows here

#Initialization
to_path="/mnt/efs/apps/etc/insurancejb/properties"
xml_path=$1
xml_name=$2

# Admin Server
admin_server_ip=$3

echo $#
if [ $# != 3 ];
then
		echo "Please provide correct input"
		echo "Correct format is ./file_deployment.sh <directory> <file_name> <admin_Ip>"
		exit 01
else
		sshpass -f ~/.id_rsa_cred -P 'Enter passphrase for key' scp $xml_path/$xml_name gitlab@$admin_server_ip:$to_path
fi		
