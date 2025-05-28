#ROOT storage block
ebs_enabled = false
ebs_size = 8
ebs_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "11292023"
	"DataClassification"	= "Low"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"InstanceID"			= "i-06e0381b17900537d"
	"LastUpdated"			= "11292023"
	"Name"					= "EC2-Serverless-EFS-Mount"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
volume_type = "gp3"
ebs_encrypted = true
kms_key_id = "arn:aws:kms:us-east-1:361469336240:key/fd958c85-fd3a-44d2-a088-c5de70355464"

#EC2 Instance
ami = "ami-04c97e62cb19d53f1"
instance_type = "t4g.micro"
ec2_region = "us-east-1a"
public_ip_bool = false
key_name = "fmg-serverless-prod"
subnet_id = "subnet-0052ab706c1f947c9"
ec2_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "11292023"
	"DataClassification"	= "Low"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "11292023"
	"Name"					= "EC2-Serverless-EFS-Mount"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
instance_initiated_shutdown_behavior = "stop"
private_ip        =     "10.153.2.143"

#Security Group
sg_name				= "fmg-serverless-efs-mount-sg-prod"
sg_description		= "Security group for attaching to ec2 instance for mounting efs created for serverless projects"
vpc_id				= "vpc-021b1f680addbd6db"
sg_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "11292023"
	"DataClassification"	= "Low"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "12152023"
	"Name"					= "fmg-serverless-efs-mount-sg-prod"
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