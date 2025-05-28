#ROOT storage block
ebs_enabled = false
ebs_size = 100
ebs_tags = {
	"ApplicationName"		= "Jenkins"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09082024"
	"DataClassification"	= "Low"
	"Department"			= "DOS"
	"Infrastructure"		= "False"
	"InstanceID"			= ""
	"LastUpdated"			= "09082024"
	"Name"					= "EC2-Jenkins-Node2"
	"TechStack"				= "Jenkins"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
volume_type = "gp3"
ebs_encrypted = true
kms_key_id = "arn:aws:kms:us-east-1:964190570136:key/f63edfc7-3937-4f21-bbad-803ed127e0dd"

#EC2 Instance
ami = "ami-080e1f13689e07408"
instance_type = "r7a.xlarge"
ec2_region = "us-east-1b"
public_ip_bool = false
key_name = "ec2-sonarqube-shared"
subnet_id = "subnet-0b6e645d940470870"
tags = {
    "ApplicationName" = "Jenkins"
    "Automated" = "True"
    "BackupPlan" = "None"
    "CostCenter" = "FMG"
    "CreatedBy" = "DevOps"
    "CreatedOn" = "09082024"
    "DataClassification" = "Low"
    "Department" = "DOS"
    "Infrastructure" = "False"
    "LastUpdated" = "09082024"
    "Name" = "Jenkins-Node2"
    "PatchedBy" = "SSM"
    "QSConfigName-q68bo" = "MasterPatchPolicyConfig-ScanInstall-for-ProdAccounts"
    "TechStack"				= "Jenkins"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
instance_initiated_shutdown_behavior = "stop"
private_ip        =     "10.153.11.22"

#Security Group
security_groups = ["sg-08c6999040c680669",
    "sg-0a7ea307d0861c966"]