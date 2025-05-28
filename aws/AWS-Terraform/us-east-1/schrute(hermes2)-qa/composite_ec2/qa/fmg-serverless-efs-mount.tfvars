#ROOT storage block
ebs_enabled = false
ebs_size = 8
ebs_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "05222024"
	"DataClassification"	= "Low"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"InstanceID"			= "i-0262deb78418052bf"
	"LastUpdated"			= "05222024"
	"Name"					= "EC2-Serverless-EFS-Mount"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
volume_type = "gp3"
ebs_encrypted = true
kms_key_id = "arn:aws:kms:us-east-1:634621569833:key/2946c3ae-1329-4617-94b4-22ba181e4bcf"

#EC2 Instance
ami = "ami-04b395c05193adbbd"
instance_type = "t4g.micro" 
ec2_region = "us-east-1a"
public_ip_bool = false
key_name = "fmg-schrute-qa"
subnet_id = "subnet-059a28296ee46f82f"
ec2_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "05212024"
	"DataClassification"	= "Low"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "05212024"
	"Name"					= "EC2-Serverless-EFS-Mount"
	"TechStack"				= "AWS"
	"Type"					= "adhoc"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
# instance_initiated_shutdown_behavior = "stop"
private_ip        =     "10.153.22.143"

#Security Group
sg_name				= "fmg-serverless-efs-mount-sg-qa"
sg_description		= "Security group for attaching to ec2 instance for mounting efs created for serverless projects"
vpc_id				= "vpc-00f27e42f4b836922"
sg_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "05212024"
	"DataClassification"	= "Low"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "05212024"
	"Name"					= "fmg-serverless-efs-mount-sg-qa"
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

efs_sg = ["sg-048a3462e7152ef91"]
