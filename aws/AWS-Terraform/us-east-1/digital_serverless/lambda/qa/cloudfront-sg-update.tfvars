lambda_function_name = "cloudfront-sg-update-qa"
role = "arn:aws:iam::634621569833:role/cloudfront-sg-update-lambda-role"
description = "Lambda to update cloudfront public ips in the security groups"
env_variables = {
		"DEBUG" = "true"
		"PORTS" = "443"
		"PREFIX_NAME" = "digital-cf-sg"
		"VPC_ID" = "vpc-00f27e42f4b836922"
		"REGION" = "us-east-1"
	}
tags = {
	"ApplicationName" = "Digital"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "DevOps"
	"CreatedOn" = "09022024"
	"DataClassification" = "Low"
	"Department" = "DGT"
	"Infrastructure" = "False"
	"LastUpdated" = "09022024"
	"TechStack" = "Python"
	"Usage" = "Project"
	"Version" = "1.0"
	}
memory_size = 256
timeout = 10
reserved_concurrent_executions = -1
publish = false
runtime = "python3.8"
handler = "cloudfront-sg-update.lambda_handler"
filename = "py/cloudfront-sg-update.zip"
package_type = "Zip"
source_code_hash = "py/cloudfront-sg-update.zip"
# Set attach_sns_permission false during lambda creation, then create sns subscription again execute this terraform with attach_sns_permission true
attach_sns_permission = true