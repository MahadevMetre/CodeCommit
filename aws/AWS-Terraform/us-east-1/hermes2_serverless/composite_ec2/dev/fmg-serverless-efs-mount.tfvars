#ROOT storage block
ebs_enabled = false
ebs_size = 8
ebs_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "11162023"
	"DataClassification"	= "Low"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"InstanceID"			= "i-056bf7c133c4c5657"
	"LastUpdated"			= "11162023"
	"Name"					= "EC2-Serverless-EFS-Mount"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
volume_type = "gp3"
ebs_encrypted = true
kms_key_id = "arn:aws:kms:us-east-1:116762271881:key/677e738c-9d85-4b15-be79-d3e89b8c31f5"

#EC2 Instance
ami = "ami-04c97e62cb19d53f1"
instance_type = "t4g.micro"
ec2_region = "us-east-1a"
public_ip_bool = false
key_name = "fmg-serverless-dev"
subnet_id = "subnet-06291ceaa523f684c"
ec2_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "11162023"
	"DataClassification"	= "Low"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "11162023"
	"Name"					= "EC2-Serverless-EFS-Mount"
	"TechStack"				= "AWS"
	"Type"					= "adhoc"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
instance_initiated_shutdown_behavior = "stop"
private_ip        =     "10.153.14.143"

#Security Group
sg_name				= "fmg-serverless-efs-mount-sg-dev"
sg_description		= "Security group for attaching to ec2 instance for mounting efs created for serverless projects"
vpc_id				= "vpc-00ff8e33839358d28"
sg_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "11162023"
	"DataClassification"	= "Low"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "11162023"
	"Name"					= "fmg-serverless-efs-mount-sg-dev"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
  sg_ingress_rules  = {
  "1" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.64.0.0/16"]
    description = "SSH From Palo VPN"
  },
  "2" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.153.10.12/32"]
    description = "SSH From DevOps Server"
  }
}