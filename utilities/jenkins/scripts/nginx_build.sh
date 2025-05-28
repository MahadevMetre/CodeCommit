#!/bin/bash

my_dir=$WORKSPACE
app_name=$1
dist_type=$2

cd $my_dir
npm install
ng build
if [ $? -ne 0 ]; then
	exit 1
fi

if [ ! -d "$my_dir/dist" ]; then
	echo dist folder not found inside the workspace $my_dir. Exiting abnormally.
	exit 1
fi

cd $my_dir/dist
tar cf $app_name.tar.gz $app_name
if [[ "$dist_type" == "qa-only" || "$dist_type" == "both" ]]; then
	mv $app_name $app_name-qa
	cd $app_name-qa
	sed -i "s/${app_name}/${app_name}-qa/" index.html
	cd ..
	tar cf $app_name-qa.tar.gz $app_name-qa
	rm -rf $app_name-qa
	if [ "$dist_type" == "qa-only" ]; then
		rm -f $app_name.tar.gz
	fi
fi
rm -rf $app_name
mkdir -p $BACKUP_PATH_BUILD/
cp -a $my_dir/dist/. $BACKUP_PATH_BUILD/
rm -rf $my_dir/