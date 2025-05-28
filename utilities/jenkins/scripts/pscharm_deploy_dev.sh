#!/bin/bash
echo $2
echo $3
echo "deployment starts in server " $2
echo $1
zip_file=$4
echo $zip_file

sshpass -f ~/.id_rsa_cred -P 'Enter passphrase for key' scp $1/$zip_file gitlab@$2:/common/deploy/pscharm/
echo $?
sshpass -f ~/.id_rsa_cred -P 'Enter passphrase for key' ssh -i ~/.ssh/id_rsa gitlab@$2 "
echo testing in server 14.23
cd /opt/pscharm;
pwd;
sshpass -f ~/.id_rsa_cred -P 'password for gitlab:' sudo -H -u pscharm bash -c ' rm -rf src
mv /common/deploy/pscharm/$zip_file /opt/pscharm
tar -xvf $zip_file'
sshpass -f ~/.id_rsa_cred -P 'password for gitlab:' sudo systemctl restart pscharm;
echo $?;
sshpass -f ~/.id_rsa_cred -P 'password for gitlab:' sudo rm -rf $zip_file"
echo  $?
