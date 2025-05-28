#ROOT storage block
ebs_enabled = true
ebs_size = 20
ebs_tags = {
	"ApplicationName"		= "kube_jumphost"
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
	"Name"					= "kube_jumphost_server"
	"TechStack"				= "kube_jumphost"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
volume_type = "gp3"
ebs_encrypted = true
kms_key_id = "arn:aws:kms:us-east-1:964190570136:key/f63edfc7-3937-4f21-bbad-803ed127e0dd"

#EC2 Instance
ami = "ami-0182f373e66f89c85"
instance_type = "t2.medium"
ec2_region = "us-east-1b"
public_ip_bool = false
key_name = "kube"
subnet_id = "subnet-0b6e645d940470870"
tags = {
	"ApplicationName"		= "kube_jumphost"
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
	"Name"					= "kube_jumphost_server"
	"TechStack"				= "kube_jumphost"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
instance_initiated_shutdown_behavior = "stop"
private_ip        =     "10.153.11.25"

#Security Group
security_groups = ["sg-08c6999040c680669",
    "sg-0a7ea307d0861c966"]