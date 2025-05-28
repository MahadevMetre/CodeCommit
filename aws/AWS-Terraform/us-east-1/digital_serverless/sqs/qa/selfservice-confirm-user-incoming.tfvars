sqs_queue_name				=	"selfservice-confirm-user-incoming"
environment					=	"qa"
dig_confirm_user_incoming	=	true

publisher_list				=	[
									"arn:aws:iam::634621569833:role/digital-lambda-role-qa"
	]
consumer_list				=	[
									"arn:aws:iam::894891841990:user/Digital-SQS-User-NonProd"
	]

root_arn					=	"arn:aws:iam::634621569833:root"

tags						=	{
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
    "TechStack" = "AWS"
    "Usage" = "Project"
    "Version" = "1.0"
}