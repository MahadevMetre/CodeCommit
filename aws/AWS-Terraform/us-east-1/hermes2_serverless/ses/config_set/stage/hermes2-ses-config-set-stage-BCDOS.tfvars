config_set_name = "hermes2-ses-config-set-stage-BCDOS"
config_set_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "08242023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "08242023"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

event_dest_name = "hermes2-ses-events-topic-stage"
event_types = ["BOUNCE", "CLICK", "DELIVERY", "OPEN", "SEND"]
sns_topic_arn = "arn:aws:sns:us-east-1:702230634984:hermes2-ses-events-topic-stage"