config_set_name = "hermes2-ses-config-set-dr-BCDOS"
config_set_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "02232024"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "02232024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

event_dest_name = "hermes2-ses-events-topic-dr"
event_types = ["BOUNCE", "CLICK", "DELIVERY", "OPEN", "SEND"]
sns_topic_arn = "arn:aws:sns:us-west-2:214946096060:hermes2-ses-events-topic-dr"