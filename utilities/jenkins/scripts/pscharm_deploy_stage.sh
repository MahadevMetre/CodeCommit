#!/bin/bash
workspace=$1
instance1=$2
instance2=$3
echo $instance1 "server instance"
zip_file=$4
echo $zip_file "- zipped file"

sshpass -f ~/.id_rsa_cred -P 'Enter passphrase for key' scp $workspace/$zip_file gitlab@$instance1:/common/deploy/pscharm/
echo $?  - scp status
sshpass -f ~/.id_rsa_cred -P 'Enter passphrase for key' ssh -i ~/.ssh/id_rsa gitlab@$instance1 "
echo deploying in server instance $instance1
cd /opt/pscharm;
sshpass -f ~/.id_rsa_cred -P 'password for gitlab:' sudo -H -u pscharm bash -c ' 
pwd 
rm -rf src
echo $? - removing exisiting src 
cp /common/deploy/pscharm/$zip_file /opt/pscharm
tar -xvf $zip_file
cd src/batch/utils
echo modifying config.ini
mv config.ini_stage config.ini
ls
'
echo Restarting pscharm
sshpass -f ~/.id_rsa_cred -P 'password for gitlab:' sudo systemctl restart pscharm;
echo $? - rebooting pscharm status;
sshpass -f ~/.id_rsa_cred -P 'password for gitlab:' sudo rm -rf $zip_file"
echo  $? 

sshpass -f ~/.id_rsa_cred -P 'Enter passphrase for key' ssh -i ~/.ssh/id_rsa gitlab@$instance2 "
echo deploying in server instance $instance2    
cd /opt/pscharm;
sshpass -f ~/.id_rsa_cred -P 'password for gitlab:' sudo -H -u pscharm bash -c ' 
cp /common/deploy/pscharm/$zip_file /opt/pscharm
rm -rf src
echo $? - removing existing src
tar -xvf $zip_file
pwd
cd src/batch/utils
echo Modifying config.ini
mv config.ini_stage config.ini
ls
sed -i 's/server1/server2/g' config.ini
echo $? - replacement of logger file in $instance2 status'
sshpass -f ~/.id_rsa_cred -P 'password for gitlab:' sudo systemctl restart pscharm;
echo $? - rebooting pscharm status;
sshpass -f ~/.id_rsa_cred -P 'password for gitlab:' sudo rm -rf $zip_file"
