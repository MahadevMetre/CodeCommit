lambda_function_name = "fmg-app-function-pci"
role                 = "arn:aws:iam::601751840347:role/marketing-vanity-lambda-role-pci"
description          = "fmg-app-function lambda for OAuth2.0"
env_variables = {
  "Key" = "value"
}
tags = {
  "ApplicationName" : "Marketing",
  "Automated" : "True",
  "BackupPlan" : "None",
  "CostCenter" : "FMG",
  "CreatedBy" : "DevOps",
  "CreatedOn" : "07222024",
  "DataClassification" : "PCI",
  "Department" : "MKT",
  "Infrastructure" : "False",
  "LastUpdated" : "07222024",
  "TechStack" : "NodeJS",
  "Usage" : "Project",
  "Version" : "1.0"
}
memory_size                    = 512
timeout                        = 3
reserved_concurrent_executions = -1
publish                        = false
runtime                        = "nodejs20.x"
handler                        = "index.handler"
filename                       = "js/fmg-app-function-pci.zip"
package_type                   = "Zip"
source_code_hash               = "js/fmg-app-function-pci.zip"

