lambda_function_name = "selfservice-post-confirmation-pci"
role = "arn:aws:iam::601751840347:role/digital-lambda-role-pci"
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
	"CreatedOn" = "08032022"
	"DataClassification" = "Low"
	"Department" = "DGT"
	"Infrastructure" = "False"
	"LastUpdated" = "01242024"
	"TechStack" = "NodeJS"
	"Usage" = "Project"
	"Version" = "1.0"
	}
memory_size = 512
timeout = 5
subnets = ["subnet-0a33ed77fe2cfb6ef","subnet-0a797df6e7dcae3db"]
security_groups = ["sg-0a0103659b308d78b","sg-0f4493af34ac18357"]
reserved_concurrent_executions = -1
publish = false
runtime = "nodejs16.x"
handler = "selfservice-post-confirmation.handler"
filename = "js/selfservice-post-confirmation.zip"
package_type = "Zip"
source_code_hash = "js/selfservice-post-confirmation.zip"