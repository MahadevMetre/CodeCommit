sqs_queue_name				=	"selfservice-confirm-user-error"
environment					=	"dr"
dig_confirm_user_error		=	true

publisher_list				=	[]
consumer_list				=	[
									"arn:aws:iam::894891841990:user/Digital-SQS-User-DR"
	]

root_arn					=	"arn:aws:iam::214946096060:root"

tags						=	{
	"ApplicationName" = "Digital"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "mfaizudeen"
	"CreatedOn" = "03202023"
	"DataClassification" = "Low"
	"Department" = "DGT"
	"Infrastructure" = "False"
	"LastUpdated" = "03202023"
	"TechStack" = "AWS"
	"Usage" = "Project"
	"Version" = "1.0"
}