config_set_name = "digital-failure-email-tracker-stage"
config_set_tags = {
	"ApplicationName"		= "Digital"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09262023"
	"DataClassification"	= "None"
	"Department"			= "DGT"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09262023"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

event_dest_name = "digital-failure-email-tracker-stage"
event_types = ["BOUNCE", "COMPLAINT", "DELIVERY_DELAY", "REJECT", "RENDERING_FAILURE"]
sns_topic_arn = "arn:aws:sns:us-east-1:702230634984:digital-failure-email-tracker-stage"