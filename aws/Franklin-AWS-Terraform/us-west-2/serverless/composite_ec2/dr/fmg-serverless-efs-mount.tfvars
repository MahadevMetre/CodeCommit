#ROOT storage block
ebs_enabled = false
ebs_size = 8
ebs_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "02232024"
	"DataClassification"	= "Low"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"InstanceID"			= "i-006a42b1f6e33525d"
	"LastUpdated"			= "02232024"
	"Name"					= "EC2-Serverless-EFS-Mount"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
volume_type = "gp3"
ebs_encrypted = true
kms_key_id = "arn:aws:kms:us-west-2:214946096060:key/3e9f5592-74c6-4a6c-b2b0-13dbfe5a063d"

#EC2 Instance
ami = "ami-0fc7f412d19342ac5"
instance_type = "t4g.micro"
ec2_region = "us-west-2a"
public_ip_bool = false
key_name = "fmg-serverless-dr"
subnet_id = "subnet-0b927d24fec28d40b"
ec2_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "02232024"
	"DataClassification"	= "Low"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "02232024"
	"Name"					= "EC2-Serverless-EFS-Mount"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
instance_initiated_shutdown_behavior = "stop"
private_ip        =     "10.153.42.143"

#Security Group
sg_name				= "fmg-serverless-efs-mount-sg-dr"
sg_description		= "Security group for attaching to ec2 instance for mounting efs created for serverless projects"
vpc_id				= "vpc-0e79e26eb537504d0"
sg_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "02232024"
	"DataClassification"	= "Low"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "02232024"
	"Name"					= "fmg-serverless-efs-mount-sg-dr"
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
  },
  "3" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.153.30.80/32"]
    description = "SSH From CrushFTP Instance 1 For EFT"
  },
  "4" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.153.31.164/32"]
    description = "SSH From CrushFTP Instance 2 For EFT"
  },
  "5" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.153.10.219/32"]
    description = "Verinext-SSH from Shared Prv Instance"
  }
}