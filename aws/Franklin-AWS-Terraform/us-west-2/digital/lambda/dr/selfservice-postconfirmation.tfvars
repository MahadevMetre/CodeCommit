lambda_function_name = "selfservice-post-confirmation-dr"
role = "arn:aws:iam::214946096060:role/digital-lambda-role-dr"
description = "This is a post confirmation lambda trigger for cognito"
env_variables = {
        "BLOB" = "AQICAHhpgarfAJGNwCu+nUEpfEs98L3ScPojfJgQYQaUajUohQEsB80GkKEb1QKlgvHl7BDSAAAAeDB2BgkqhkiG9w0BBwagaTBnAgEAMGIGCSqGSIb3DQEHATAeBglghkgBZQMEAS4wEQQMZODoWh2jO0ifd1ANAgEQgDUCJImtsaV5fe3R9Izy1W/fG2FyrXiLQpU+BxB5LE1u24DLA7ErKJjb4qSOJRR7cGWQyJ5VKw=="
        "LOGGER" = "DEBUG"
    }
tags = {
    "ApplicationName" = "Digital"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "DevOps"
	"CreatedOn" = "03202023"
	"DataClassification" = "Low"
	"Department" = "DGT"
	"Infrastructure" = "False"
	"LastUpdated" = "04222024"
	"TechStack" = "NodeJS"
	"Usage" = "Project"
	"Version" = "1.0"
        }
memory_size = 512
timeout = 5
subnets = ["subnet-0b927d24fec28d40b","subnet-0a1d3486597f552fe"]
security_groups = ["sg-0e65fd3db25a785e9","sg-00737bee850e3a634"]
reserved_concurrent_executions = -1
publish = false
runtime = "nodejs20.x"
handler = "selfservice-post-confirmation.handler"
filename = "js/selfservice-post-confirmation.zip"
package_type = "Zip"
source_code_hash = "js/selfservice-post-confirmation.zip"