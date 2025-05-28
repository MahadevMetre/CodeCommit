config_set_name = "hermes2-ses-config-set-prod-BDOS"
config_set_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "11082023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "11082023"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

event_dest_name = "hermes2-ses-events-topic-prod"
event_types = ["BOUNCE", "DELIVERY", "OPEN", "SEND"]
sns_topic_arn = "arn:aws:sns:us-east-1:361469336240:hermes2-ses-events-topic-prod"