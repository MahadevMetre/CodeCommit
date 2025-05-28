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
	"InstanceID"			= "i-0b9ef7667ff2f60ca"
	"LastUpdated"			= "11162023"
	"Name"					= "EC2-Serverless-EFS-Mount"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
volume_type = "gp3"
ebs_encrypted = true
kms_key_id = "arn:aws:kms:us-east-1:702230634984:key/d9124522-5018-4433-80a0-c6bd7eb0de6c"

#EC2 Instance
ami = "ami-04c97e62cb19d53f1"
instance_type = "t4g.micro"
ec2_region = "us-east-1a"
public_ip_bool = false
key_name = "fmg-serverless-stage"
subnet_id = "subnet-0ed61b6beb807094e"
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
private_ip        =     "10.153.18.143"

#Security Group
sg_name				= "fmg-serverless-efs-mount-sg-stage"
sg_description		= "Security group for attaching to ec2 instance for mounting efs created for serverless projects"
vpc_id				= "vpc-0051d323df13c7db3"
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
	"LastUpdated"			= "12152023"
	"Name"					= "fmg-serverless-efs-mount-sg-stage"
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
    cidr_blocks = ["10.153.18.164/32"]
    description = "SSH From CrushFTP Instance 1 For EFT"
  },
  "4" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.153.19.245/32"]
    description = "SSH From CrushFTP Instance 2 For EFT"
  }
}