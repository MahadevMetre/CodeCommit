config_set_name = "hermes2-ses-config-set-qa-DS"
config_set_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "05142024"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "05142024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

event_dest_name = "hermes2-ses-events-topic-qa"
event_types = ["DELIVERY", "SEND"]
sns_topic_arn = "arn:aws:sns:us-east-1:634621569833:hermes2-ses-events-topic-qa"