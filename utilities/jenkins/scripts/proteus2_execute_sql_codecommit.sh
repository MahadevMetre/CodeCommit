#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m'

account=$1
jenkins_user=$BUILD_USER_ID
job_config_file="/opt/scripts/config/proteus2_execute_sql.json"

repo_base_url=https://git-codecommit.us-east-1.amazonaws.com/v1/repos/proteus2
repo_path=$2

build_permission=`jq -r ".\"$account\" | any(index(\"$jenkins_user\"))" "$job_config_file"`

if [[ "$build_permission" != "true" ]];
then
	printf "${PURPLE}Hello ${GREEN}$BUILD_USER${PURPLE}, you are not authorized to build this job.${RED}\n"
	exit 1
fi

deploy_branch_access=`jq -r ".deploy_branch_access | any(index(\"$jenkins_user\"))" "$job_config_file"`

if [[ "$repo_path" == "branches/deploy_new" && "$deploy_branch_access" != "true" ]];
then
	printf "${PURPLE}Hello ${GREEN}$BUILD_USER${PURPLE}, you are not authorized to build this job.${RED}\n"
	exit 1
fi

if [[ "$account" == "pci" && "$repo_path" != "branches/deploy_new" ]];
then
	printf "${PURPLE}Hello ${GREEN}$BUILD_USER${PURPLE}, you are not authorized to promote to ${GREEN}$account${PURPLE} from ${GREEN}$repo_path.${RED}\n"
	exit 1
fi

rootFolder=$3

rm -rf "$WORKSPACE"
mkdir -p "$WORKSPACE"
cd "$WORKSPACE"

svn checkout --quiet --username $svn_username --password $svn_password "$repo_base_url/$repo_path/$rootFolder" $rootFolder

if [[ ! -d "$WORKSPACE/$rootFolder" ]];
then
	printf "${PURPLE}The folder ${BLUE}$rootFolder ${PURPLE}does not exist, ${RED}exiting the script.\n"
	exit 1
fi

cd "$WORKSPACE/$rootFolder"

folderName=$4
fileName=$5
db_name=$6
testing=$7
current_dir=`pwd`
jsonFile=`jq -r ".properties.json_config_name.\"$rootFolder\"" "$job_config_file"`
jsonPath=$current_dir/$jsonFile
working_dir=$current_dir/temp_dir
variable_list_file=$working_dir/variable_list.txt
variable_value_file=$working_dir/variable_value.txt

if [[ "${account}" == "Choose One" ]];
then
	printf "${RED}Too lazy to change the default values...?\n"
	exit 1
fi

if [[ $folderName = *[[:space:]]* || $fileName = *[[:space:]]* || "${fileName:0-4}" != ".sql" ]];
then
	printf "${RED}Non-SQL extention for filename detected / space detected in the input.\n"
	exit 1
fi

# Process the folderName variable to replace \ with / and remove trailing /
folderName=`echo $folderName | sed -e 's/\\\/\\//g'`
while [[ "${folderName:0-1}" == "/" ]];
do
	folderName="${folderName::-1}"
done

filePath=$current_dir/$folderName/$fileName

printf "${PURPLE}Account : ${GREEN}$account${NC}\n"
printf "${PURPLE}Repo path : ${GREEN}$repo_path${NC}\n"
printf "${PURPLE}Root folder : ${GREEN}$rootFolder${NC}\n"
printf "${PURPLE}Folder name : ${GREEN}$folderName${NC}\n"
printf "${PURPLE}File name : ${GREEN}$fileName${NC}\n"
printf "${PURPLE}Database name : ${GREEN}$db_name${NC}\n"
printf "${PURPLE}Testing : ${GREEN}$testing${NC}\n"

if [[ ! -d "$folderName" ]];
then
	printf "${PURPLE}The folder ${BLUE}$folderName ${PURPLE}does not exist, ${RED}exiting the script.\n"
	exit 1
fi

if [[ ! -f "$jsonPath" ]];
then
	printf "${PURPLE}The file ${BLUE}$jsonFile ${PURPLE}does not exist, ${RED}exiting the script.\n"
	exit 1
fi

if ! jq empty $jsonPath 2> /dev/null;
then
	printf "${PURPLE}The input json ${BLUE}$jsonFile ${PURPLE}is invalid, ${RED}exiting the script.\n"
	exit 1
fi

if [[ "${account}" == "dev" ]];
then
	db_host=fmg-dw.cozyucwamcyq.us-east-1.redshift.amazonaws.com
	db_pass=$admin_pass_dev
elif [[ "${account}" == "stage" ]];
then
	db_host=fmg-dw.c1jr2alqu97x.us-east-1.redshift.amazonaws.com
	db_pass=$admin_pass_stage
elif [[ "${account}" == "pci" ]];
then
	db_host=fmg-dw.cyznzm97crev.us-east-1.redshift.amazonaws.com
	db_pass=$admin_pass_pci
fi
export PGPASSWORD=$db_pass

rm -rf $working_dir
mkdir -p $working_dir
jq -r ".variables[].$account[] | keys_unsorted | .[]" $jsonPath > $variable_list_file
jq -r ".variables[].$account[] | .[]" $jsonPath > $variable_value_file

if [[ "${fileName}" != "*.sql" ]];
then
	if [[ ! -f "$filePath" ]];
	then
		printf "${PURPLE}The file ${BLUE}$fileName ${PURPLE}does not exist, ${RED}exiting the script.\n"
		exit 1
	else
		echo $fileName > file_Names.txt
	fi
else
	ls -1 $current_dir/$folderName | grep -i ".sql$" | sort -n > file_Names.txt
fi

current_count=0
warning_count=0
error_count=0
total_count=`cat file_Names.txt | wc -l`

while read fileName
do

	current_count=$[$current_count +1]
	printf "${BLUE}----------------------------------------<><><><><><><><><><>----------------------------------------${NC}\n"

	filePath=$current_dir/$folderName/$fileName
	processedFile=$working_dir/$fileName
	cp $filePath $processedFile

	printf "${PURPLE}Processing the file ${GREEN}$fileName ${PURPLE}(${BLUE}$current_count ${PURPLE}of ${BLUE}$total_count${PURPLE})${NC}\n"

	# Count open and closing braces and exit if not equal
	open_braces_count=`grep -Fo "{" $processedFile | wc -l`
	closing_braces_count=`grep -Fo "}" $processedFile | wc -l`
	if [[ "$open_braces_count" -ne "$closing_braces_count" ]];
	then
		printf "${PURPLE}The number of open braces and closing braces does not match, ${RED}exiting the script.\n"
		exit 1
	fi

	# Check for improper variable substitution and exit if found any
	# Commented out due to some issues - two variables with same substring cause issues, eg : var1, var12
	# while read var_word
	# do
		# var_word_count=`grep "$var_word" $processedFile | wc -l`
		# if [[ "$var_word_count" -gt 0 ]];
		# then
			# proper_var_word_count=`grep "{{$var_word}}" $processedFile | wc -l`
			# if [[ "$var_word_count" -ne "$proper_var_word_count" ]];
			# then
				# printf "${PURPLE}The variable ${BLUE}$var_word ${PURPLE}is not substituted properly, ${RED}exiting the script.\n"
				# exit 1
			# fi
		# fi
	# done < $variable_list_file

	# Check for hardcoded values and exit if found any
	while read var_value
	do
		var_value_count=`grep -i "$var_value" $processedFile | wc -l`
		if [[ "$var_value_count" -gt 0 ]];
		then
			printf "${PURPLE}The variable value ${BLUE}$var_value ${PURPLE}is hardcoded in the input file, ${RED}exiting the script.\n"
			exit 1
		fi
	done < $variable_value_file

	# Replace the variable values
	while read var_name
	do
		var_value=`jq -r ".variables[].$account[].\"$var_name\"" $jsonPath`
		var_name_count=`grep -o "{{$var_name}}" $processedFile | wc -l`
		if [[ "$var_name_count" -gt 0 ]];
		then
			printf "${PURPLE}Replaced ${GREEN}$var_name_count ${PURPLE}occurrence(s) of the variable ${GREEN}{{$var_name}} ${PURPLE}with ${GREEN}$var_value${NC}\n"
			sed -i "s|{{$var_name}}|$var_value|g" $processedFile
		fi
	done < $variable_list_file

	printf "${PURPLE}Successfully processed the file.\n"

	if [[ "${testing}" == "false" ]];
	then
		printf "${BLUE}\nExecuting queries from the file.${GREEN}\n\n"
		psql -h $db_host -p 5439 -d $db_name -U admin -f $processedFile > query_output.txt 2>&1
		grep -q ": INFO:" query_output.txt && printf "${GREEN}"
		grep -q ": WARNING:" query_output.txt && warning_count=$[$warning_count +1] && printf "${ORANGE}"
		grep -q ": ERROR:" query_output.txt && error_count=$[$error_count +1] && printf "${RED}"
		sed -i "s|psql:$working_dir/||g" query_output.txt
		cat query_output.txt
	fi
done < file_Names.txt

printf "${BLUE}----------------------------------------<><><><><><><><><><>----------------------------------------${GREEN}\n"

if [[ "$warning_count" -gt 0 ]];
then
	printf "${ORANGE}Number of query execution(s) completed with warnings : ${BLUE}$warning_count${GREEN}\n"
fi

if [[ "$error_count" -gt 0 ]];
then
	printf "${RED}Number of query execution(s) completed with errors : ${BLUE}$error_count${RED}\n"
	exit 1
fi
