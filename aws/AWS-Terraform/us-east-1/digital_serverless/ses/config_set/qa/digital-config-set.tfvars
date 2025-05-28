config_set_name = "autoscaling_topic_qa"
config_set_tags = {
	"ApplicationName"		= "Digital"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09102024"
	"DataClassification"	= "Low"
	"Department"			= "DGT"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09102024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

event_dest_name = "autoscaling_topic_qa"
event_types = ["BOUNCE", "COMPLAINT", "DELIVERY_DELAY", "REJECT", "RENDERING_FAILURE"]
sns_topic_arn = "arn:aws:sns:us-east-1:634621569833:autoscaling_topic_qa"