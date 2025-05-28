config_set_name = "digital-email-tracking-pci"
config_set_tags = {
	"ApplicationName"		= "Digital"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "06122024"
	"DataClassification"	= "None"
	"Department"			= "DGT"
	"Infrastructure"		= "False"
	"LastUpdated"			= "06122024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

event_dest_name = "digital-email-tracking-firehose-pci"
event_types = ["CLICK", "DELIVERY", "OPEN", "SENDS"]

log_group_name = "/aws/kinesisfirehose/PUT-digital-email-tracking-pci"
log_retention_days = "30"

bucket_short_name = "digital-email-tracking"
environment = "pci"
logging_bucket_name = "franklin-pci-s3-access-logs"
logging_bucket_base_prefix = "digital-email-tracking-pci"
acl = "private"
s3b_tags ={
    "ApplicationName"		= "Digital"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "06122024"
	"DataClassification"	= "None"
	"Department"			= "DGT"
	"Infrastructure"		= "False"
	"LastUpdated"			= "06122024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

fs_stream_name = "PUT-digital-email-tracking-pci"
ext_s3_config_custom_time_zone = "America/Chicago"
ext_s3_config_file_extension = ".json"
ext_s3_config_s3_backup_mode = "Enabled"
ext_s3_config_buffering_size = 5
ext_s3_config_buffering_interval = 900
s3_backup_config_prefix = "backup/"
s3_backup_config_error_output_prefix = "!{firehose:error-output-type}"
lambda_processor_buffer_size = 3
lambda_processor_buffer_interval = 300
fs_tags = {
	"ApplicationName"		= "Digital"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "06122024"
	"DataClassification"	= "None"
	"Department"			= "DGT"
	"Infrastructure"		= "False"
	"LastUpdated"			= "06122024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

role_name		= "digital-email-tracking-role-pci"
iam_role_desc	= "Role used to deliver ses events to S3"
role_tags		= {
	"ApplicationName": "Digital",
	"Automated": "True",
	"BackupPlan": "None",
	"CostCenter": "FMG",
	"CreatedBy": "DevOps",
	"CreatedOn": "06122024",
	"DataClassification": "None",
	"Department": "DGT",
	"Infrastructure": "False",
	"LastUpdated": "06122024",
	"TechStack": "AWS",
	"Usage": "Project",
	"Version": "1.0"
}

iam_policy_name					= "digital-email-tracking-policy-pci"
iam_policy_tags					= {
	"ApplicationName": "Digital",
	"Automated": "True",
	"BackupPlan": "None",
	"CostCenter": "FMG",
	"CreatedBy": "DevOps",
	"CreatedOn": "06122024",
	"DataClassification": "None",
	"Department": "DGT",
	"Infrastructure": "False",
	"LastUpdated": "06122024",
	"TechStack": "AWS",
	"Usage": "Project",
	"Version": "1.0"
}
digital_email_tracking_policy	= "true"
iam_policy_desc					= "Policy which allows ses and firehose to deliver the events to s3"

lambda_function_name = "transform-digital-ses-event"
lambda_role = "arn:aws:iam::601751840347:role/fmg-dw-lambda-role" 
lambda_description = "Function to transform Firehose stream event to nested json."
lambda_env_variables = {
	"bucket_name"	= "fmg-dw-s3-datalake"
	"s3_prefix"		= "digital-ses/"
}
lambda_tags = {
	"ApplicationName": "Digital",
	"Automated": "True",
	"BackupPlan": "None",
	"CostCenter": "FMG",
	"CreatedBy": "DevOps",
	"CreatedOn": "06122024",
	"DataClassification": "None",
	"Department": "DGT",
	"Infrastructure": "False",
	"LastUpdated": "06122024",
	"TechStack": "Python",
	"Usage": "Project",
	"Version": "1.0"
}
lambda_memory_size = 128
lambda_timeout = 300
lambda_runtime = "python3.12"
lambda_handler = "transform-digital-ses-event.lambda_handler"
lambda_filename = "py/transform-digital-ses-event.zip"
lambda_package_type = "Zip"
lambda_source_code_hash = "py/transform-digital-ses-event.zip"