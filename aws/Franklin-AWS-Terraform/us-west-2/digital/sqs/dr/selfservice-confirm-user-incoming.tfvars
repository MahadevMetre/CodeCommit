sqs_queue_name				=	"selfservice-confirm-user-incoming"
environment					=	"dr"
dig_confirm_user_incoming	=	true

publisher_list				=	[
									"arn:aws:iam::214946096060:role/digital-lambda-role-dr"
	]
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