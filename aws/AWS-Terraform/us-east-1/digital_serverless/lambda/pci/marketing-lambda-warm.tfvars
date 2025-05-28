lambda_function_name = "marketing-lambda-warm-pci"
role                 = "arn:aws:iam::601751840347:role/digital-lambda-docker-role-pci"
description = "marketing-lambda-warm-pci"
env_variables = {
  "REGION_NAME"                     = "us-east-1"
  "LOG_LEVEL"                       = "DEBUG"
  "MARKETING_LAMBDA_NAMES"          = "marketing-default-delivery-pci,marketing-coverage-details-pci,marketing-matchbackenroll-pci,marketing-coverage-upsell-pci,marketing-manage-eventspokenkeys-pci,marketing-validate-accesscode-pci,marketing-manage-spokenkey-pci,marketing-enroll-pci"
}
tags = {
	"ApplicationName": "Marketing",
	"Automated": "True",
	"BackupPlan": "None",
	"CostCenter": "FMG",
	"CreatedBy": "DevOps",
	"CreatedOn": "07222024",
	"DataClassification": "PCI",
	"Department": "MKT",
	"Infrastructure": "False",
	"LastUpdated": "07222024",
	"TechStack": "Java",
	"Usage": "Project",
	"Version": "1.0"
}
memory_size = 512
timeout = 15
subnets = ["subnet-0a33ed77fe2cfb6ef","subnet-0a797df6e7dcae3db"]
security_groups = ["sg-03922a05400d650c8"]
reserved_concurrent_executions = -1
publish = false
runtime = "java11"
handler = "com.ins.web.MarketingHandler::handleRequest"
filename = "jar/sample.jar"
package_type = "Zip"
source_code_hash = "jar/sample.jar"