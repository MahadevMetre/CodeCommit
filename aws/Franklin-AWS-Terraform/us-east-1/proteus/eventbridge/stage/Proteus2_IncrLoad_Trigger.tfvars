eb_rule_name = "Proteus2_IncrLoad_Trigger"
stepfunction_arn = "arn:aws:states:us-east-1:702230634984:stateMachine:Proteus2_IncrLoad_Wrapper"
role = "arn:aws:iam::702230634984:role/fmg-dw-eventbridge-role"
schedule = "rate(60 minutes)"
tags = {
	"ApplicationName": "Proteus2",
	"Automated": "True",
	"BackupPlan": "None",
	"CostCenter": "FMG",
	"CreatedBy": "DevOps",
	"CreatedOn": "10272023",
	"DataClassification": "None",
	"Department": "PTS2",
	"Infrastructure": "False",
	"LastUpdated": "10272023",
	"TechStack": "AWS",
	"Usage": "Project",
	"Version": "1.0"
}