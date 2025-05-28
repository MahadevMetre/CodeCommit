config_set_name = "hermes2-ses-config-set-dev-BDOS"
config_set_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "10192023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "10192023"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

event_dest_name = "hermes2-ses-events-topic-dev"
event_types = ["BOUNCE", "DELIVERY", "OPEN", "SEND"]
sns_topic_arn = "arn:aws:sns:us-east-1:116762271881:hermes2-ses-events-topic-dev"