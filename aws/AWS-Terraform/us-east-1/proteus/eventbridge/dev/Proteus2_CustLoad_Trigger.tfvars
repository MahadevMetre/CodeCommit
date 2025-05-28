eb_rule_name = "Proteus2_CustLoad_Trigger"
stepfunction_arn = "arn:aws:states:us-east-1:116762271881:stateMachine:Proteus2_CustLoad_Wrapper"
role = "arn:aws:iam::116762271881:role/fmg-dw-eventbridge-role"
schedule = "rate(4 hours)"
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