#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m'

mvn_cmd="clean package -DskipTests"
build_prop_file="deploy/build.properties"

cd $WORKSPACE

# Read Lambda names and artifact name from build.properties
grep 'lambda.function.name.dev=' $build_prop_file | cut -d'=' -f2 | sed -e 's/\r//g' > lambda_function_name_dev
grep 'lambda.function.name.qa=' $build_prop_file | cut -d'=' -f2 | sed -e 's/\r//g' > lambda_function_name_qa
grep 'lambda.function.name.stage=' $build_prop_file | cut -d'=' -f2 | sed -e 's/\r//g' > lambda_function_name_stage
grep 'lambda.function.name.preprod=' $build_prop_file | cut -d'=' -f2 | sed -e 's/\r//g' > lambda_function_name_preprod
grep 'lambda.function.name.prod=' $build_prop_file | cut -d'=' -f2 | sed -e 's/\r//g' > lambda_function_name_prod
grep 'lambda.function.name.dr=' $build_prop_file | cut -d'=' -f2 | sed -e 's/\r//g' > lambda_function_name_dr
jar_name=`grep 'lambda.artifact.name=' $build_prop_file | cut -d'=' -f2 | sed -e 's/\r//g'`
echo $jar_name > lambda_artifact_name

# Add an invalid name if the property is not found, i.e, if the file is empty
for FILE in lambda_*
do
	[ -s $FILE ] || echo INVALID_LAMBDA_NAME > $FILE
done

printf "${RED}Artifact Name : ${BLUE}$jar_name\n"
printf "${PURPLE}Dev Lambda Name : ${GREEN}`head lambda_function_name_dev`\n${NC}"
printf "${PURPLE}QA Lambda Name : ${GREEN}`head lambda_function_name_qa`\n${NC}"
printf "${PURPLE}Stage Lambda Name : ${GREEN}`head lambda_function_name_stage`\n${NC}"
printf "${PURPLE}PreProd Lambda Name : ${GREEN}`head lambda_function_name_preprod`\n${NC}"
printf "${PURPLE}Prod Lambda Name : ${GREEN}`head lambda_function_name_prod`\n${NC}"
printf "${PURPLE}DR Lambda Name : ${GREEN}`head lambda_function_name_dr`\n${NC}"

# Check if claims lambda and repeat the same steps
grep -q 'lambda.claims.function.name' $build_prop_file
if [ "$?" -eq 0 ]; then
	grep 'lambda.claims.function.name.dev=' $build_prop_file | cut -d'=' -f2 | sed -e 's/\r//g' > lambda_function_name_claims_dev
	grep 'lambda.claims.function.name.qa=' $build_prop_file | cut -d'=' -f2 | sed -e 's/\r//g' > lambda_function_name_claims_qa
	grep 'lambda.claims.function.name.stage=' $build_prop_file | cut -d'=' -f2 | sed -e 's/\r//g' > lambda_function_name_claims_stage
	grep 'lambda.claims.function.name.preprod=' $build_prop_file | cut -d'=' -f2 | sed -e 's/\r//g' > lambda_function_name_claims_preprod
	grep 'lambda.claims.function.name.prod=' $build_prop_file | cut -d'=' -f2 | sed -e 's/\r//g' > lambda_function_name_claims_prod
	grep 'lambda.claims.function.name.dr=' $build_prop_file | cut -d'=' -f2 | sed -e 's/\r//g' > lambda_function_name_claims_dr
	for FILE in lambda_function_name_claims_*
	do
		[ -s $FILE ] || echo INVALID_LAMBDA_NAME > $FILE
	done
	printf "${ORANGE}Dev Claims Lambda Name : ${BLUE}`head lambda_function_name_claims_dev`\n${NC}"
	printf "${ORANGE}QA Claims Lambda Name : ${BLUE}`head lambda_function_name_claims_qa`\n${NC}"
	printf "${ORANGE}Stage Claims Lambda Name : ${BLUE}`head lambda_function_name_claims_stage`\n${NC}"
	printf "${ORANGE}PreProd Claims Lambda Name : ${BLUE}`head lambda_function_name_claims_preprod`\n${NC}"
	printf "${ORANGE}Prod Claims Lambda Name : ${BLUE}`head lambda_function_name_claims_prod`\n${NC}"
	printf "${ORANGE}DR Claims Lambda Name : ${BLUE}`head lambda_function_name_claims_dr`\n${NC}"
fi

mvn $mvn_cmd
status_code=$?
if [ $status_code -ne 0 ]; then
	printf "${RED}The command ${PURPLE}mvn $mvn_cmd${RED} exited with error code ${PURPLE}$status_code${RED}.\n"
	rm -rf $WORKSPACE/
	exit 1
fi
cp target/$jar_name $WORKSPACE/
rm -rf .svn/ deploy/ src/ target/ pom.xml
mkdir -p $BACKUP_PATH_BUILD
cp -a $WORKSPACE/. $BACKUP_PATH_BUILD/
rm -rf $WORKSPACE/