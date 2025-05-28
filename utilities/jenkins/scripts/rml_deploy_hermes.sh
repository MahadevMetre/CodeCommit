#!/bin/bash

product=$1
server=$2
env=$3
branch=$4
build=$5

if [[ "$server" == "10.153.14.143" || "$server" == "10.153.18.143" || "$server" == "10.153.2.143" || "$server" == "10.153.42.143" ]];
then
	username="pycharm"
else
	username="gitlab"
fi

filter=$(grep "${build} ${product} ${branch}" /home/jenkins/rml_deploy/dev_deploy.prop)

array=($filter)
build_number=${array[0]}
branch=${array[2]}
revision=${array[4]}

echo Starting deployment to $server

deploy=${env}_deploy

sshpass -f ~/.id_rsa_cred -P 'Enter passphrase for key' ssh -i ~/.ssh/id_rsa $username@$server "
cd /common/data/rml/repo/templates/$product
svn update -r $revision || (svn cleanup && svn update -r $revision)"

pattern="$build_number $product $branch"

sed -i -e "/^$pattern/s/${deploy}:NO/${deploy}:YES/g" /home/jenkins/rml_deploy/dev_deploy.prop