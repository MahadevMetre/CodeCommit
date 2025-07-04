ebs_size = 30
volume_type = "gp3"
ebs_tags = {
	"ApplicationName" = "Hermes"
	"Automated" = "True"
	"BackupPlan" = "Monthly"
	"CostCenter" = "Operations"
	"CreatedBy" = "DevOps"
	"CreatedOn" = "05122024"
	"DataClassification" = "Low"
	"Department" = "HMS"
	"Infrastructure" = "False"
	"InstanceID" = "TO_BE_UPDATED"
	"LastUpdated" = "05122024"
	"Name" = "TEST_NAME_NGINX_SERVER"
	"TechStack" = "AWS"
	"Usage" = "Project"
	"Version" = "1.0"
}
ebs_encrypted = true
kms_key_id = "arn:aws:kms:us-east-1:702230634984:key/1768f1e1-0140-4b26-83ba-6e3a4f50a1d0"
ami = "ami-07caf09b362be10b8"
instance_type = "c7i.xlarge"
ec2_region = "us-east-1b"
public_ip_bool = false
key_name = "lasso-stage"
security_groups = ["sg-0903e36fc6379cd36"]
subnet_id = "subnet-076a071fa0723c80e"
tags = {
	"ApplicationName" = "Hermes"
	"Automated" = "True"
	"BackupPlan" = "Monthly"
	"CostCenter" = "Operations"
	"CreatedBy" = "DevOps"
	"CreatedOn" = "05122024"
	"DataClassification" = "Low"
	"Department" = "HMS"
	"Infrastructure" = "False"
	"LastUpdated" = "05122024"
	"Name" = "TEST_NAME_NGINX_SERVER"
	"PatchedBy" = "SSM"
	"QSConfigName-07fbk" = "FMG-Linux-Patching-STG"
	"QSConfigName-mam5p" = "MasterPatchPolicyConfig-ScanInstall-for-StagingAccount"
	"TechStack" = "AWS"
	"Type" = "adhoc"
	"Usage" = "Project"
	"Version" = "1.0"
	"WeekendShutdown" = "True"
}
instance_initiated_shutdown_behavior = "stop"
private_ip = "10.153.19.50"