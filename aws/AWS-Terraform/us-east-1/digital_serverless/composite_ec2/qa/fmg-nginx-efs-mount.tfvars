#ROOT storage block
ebs_enabled = false
ebs_size = 30
ebs_tags = {
	"ApplicationName"		= "Digital"
	"Automated"				= "True"
	"BackupPlan"			= "Weekly"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09022024"
	"DataClassification"	= "Low"
	"Department"			= "DGT"
	"Infrastructure"		= "False"
	"InstanceID"			= "TO BE UPDATED"
	"LastUpdated"			= "09022024"
	"Name"					= "EC2-Nginx-Node-Digital"
	"TechStack"				= "Nginx"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
volume_type = "gp2"
ebs_encrypted = true
kms_key_id = "arn:aws:kms:us-east-1:634621569833:key/2946c3ae-1329-4617-94b4-22ba181e4bcf"

#EC2 Instance
ami = "ami-08c80755c260e9d4b"
instance_type = "t3.small" 
ec2_region = "us-east-1a"
public_ip_bool = false
key_name = "fmg-schrute-qa"
efs_sg = ["sg-0afcfccd7af9709c3"] #sg-0afcfccd7af9709c3
subnet_id = "subnet-059a28296ee46f82f"
ec2_tags = {
	"ApplicationName"		= "Digital"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09022024"
	"DataClassification"	= "Low"
	"Department"			= "DGT"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09022024"
	"Name"					= "EC2-Nginx-Node-Digital"
	"TechStack"				= "Nginx"
	"Type"					= "adhoc"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
instance_initiated_shutdown_behavior = "stop"
private_ip        =     "10.153.22.147"

#Security Group
sg_name				= "fmg-Digital-efs-mount-sg-qa"
sg_description		= "Security group for attaching to nginix server for mounting efs created for serverless projects"
vpc_id				= "vpc-00f27e42f4b836922"
sg_tags = {
	"ApplicationName"		= "Digital"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09022024"
	"DataClassification"	= "Low"
	"Department"			= "DGT"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09022024"
	"Name"					= "fmg-Digital-efs-mount-sg-qa"
	"TechStack"				= "Nginx"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
  sg_ingress_rules  = {
  "1" = {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = ["10.153.22.0/23"]
    description = "EFS mount target"
  },
  "2" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	  cidr_blocks = ["172.21.150.0/24"]
    description = "SSH"
  },
  "3" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.217.33.72/31"]
    description = "SSH"
  },
  "4" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["172.21.150.0/24"]
    description = "HTTP"
  },
  "5" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	  cidr_blocks = ["10.153.22.0/23"]
    description = "HTTPS from public ALB"
  },
  "6" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	  cidr_blocks = ["10.64.0.0/16"]
    description = "SSH From Palo VPN"
  },
  "7" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	  cidr_blocks = ["10.153.10.219/32"]
    description = "Verinext-SharedPrvConnect"
  },
  "8" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	  cidr_blocks = ["203.62.174.143/32"]
    description = "HTTPS From Virtusa"
  },
  "9" = {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
	  cidr_blocks = ["10.153.10.219/32"]
    description = "Verinext-SharedPrvConnect"
  },
  "10" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	  cidr_blocks = ["10.33.99.102/32"]
    description = "SSH From Devlsys7"
  },
  "11" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	  cidr_blocks = ["10.153.10.12/32"]
    description = "SSH From DevOps Server"
  },
  "12" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	  cidr_blocks = ["203.62.174.143/32"]
    description = "SSH From Virtusa"
  },
  "13" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	  cidr_blocks = ["10.141.0.0/16"]
    description = "SSH From FMG Network"
  },
  "14" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	  cidr_blocks = ["10.153.22.0/24"]
    description = "HTTP"
  },
  "15" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	  cidr_blocks = ["172.21.148.0/24"]
    description = "SSH"
  },
  "16" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	  cidr_blocks = ["10.141.0.0/16"]
    description = "SSH"
  }
}
