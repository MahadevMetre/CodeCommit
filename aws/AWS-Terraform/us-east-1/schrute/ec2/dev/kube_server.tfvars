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
ebs_encrypted = "true"
kms_key_id = "arn:aws:kms:us-east-1:116762271881:key/39243139-80ea-4544-a28a-99fd8bb3bf86"

ami = "ami-0182f373e66f89c85"
instance_type = "t2.medium"
ec2_region = "us-east-1a"
public_ip_bool = false
key_name = "dev-kube"
subnet_id = "subnet-06291ceaa523f684c"
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

private_ip = "10.153.14.140"

security_groups = [
  "sg-0340579230fec9c4b",
  "sg-0dec3c563b782653b"
]
bastionhost_iamrole_name            = "kubeadminrole"
bastionhost_iaminstanceprofile_name = "instanceprofile"






# device_name = "/dev/sdh"

# # ebs_enabled


# # root_delete
# root_delete = true

