sqs_queue_name				=	"selfservice-confirm-user-error"
environment					=	"pci"
dig_confirm_user_error		=	true

publisher_list				=	[]
consumer_list				=	[
									"arn:aws:iam::894891841990:user/Digital-SQS-User-Prod"
	]

root_arn					=	"arn:aws:iam::601751840347:root"

tags						=	{
	"ApplicationName" = "Digital"
    "Automated" = "True"
    "BackupPlan" = "None"
    "CostCenter" = "FMG"
    "CreatedBy" = "DevOps"
    "CreatedOn" = "03072022"
    "DataClassification" = "PCI"
    "Department" = "DGT"
    "Infrastructure" = "False"
    "LastUpdated" = "06222023"
    "TechStack" = "AWS"
    "Usage" = "Project"
    "Version" = "1.0"
}