hermes2_error_queue_bool = true
sqs_queue_name = "hermes2-email-CPKT-TP-error-prod.fifo"
fifo_queue_bool = true
sqs_queue_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "12132023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "12132023"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
sqs_user_arn = "arn:aws:iam::894891841990:user/Hermes2-SQS-User-Prod"