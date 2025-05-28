#!/bin/bash
product=$1
server=$2
env=$3
branch=$4
build=$5
echo $product - being built
echo $branch - being deployed


prop_file=./properties/generic_rml.props

if [ -f "$prop_file" ];
then
	echo $prop_file exists in path
else
	echo $prop_file does not exist
	exit 1
fi

prop=$(grep "${product}" $prop_file)
echo $prop

if [ ${#prop} -eq 0 ];
then
	echo "No such product" 
	exit 1
fi

prop_array=($prop)
path=${prop_array[1]}


filter=$(grep "${build} ${product} ${branch}" /home/jenkins/rml_deploy/dev_deploy.prop)

array=($filter)
build_number=${array[0]}
url=${array[3]}
revision=${array[4]}
branch=${array[2]}

deploy=${env}_deploy
sshpass -f ~/.id_rsa_cred -P 'Enter passphrase for key' ssh -i ~/.ssh/id_rsa gitlab@$server "
cd $path;
svn update -r $revision"
remote_operation=$?
echo $remote_operation - Remote Operations completion status
if [[ $remote_operation != 0 ]] ;
then
	exit 1
fi

pattern="$build_number $product"

sed -i -e "/^$pattern/s/${deploy}:NO/${deploy}:YES/g" /home/jenkins/rml_deploy/dev_deploy.prop
