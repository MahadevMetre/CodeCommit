#ROOT storage block
ebs_enabled = false
ebs_size = 30
ebs_tags = {
	"ApplicationName"		= "Digital"
	"Automated"				= "True"
	"BackupPlan"			= "Weekly"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09052024"
	"DataClassification"	= "Low"
	"Department"			= "DGT"
	"Infrastructure"		= "False"
	"InstanceID"			= "i-06b62674d5ca09d15"
	"LastUpdated"			= "09052024"
	"Name"					= "EC2-Nginx-Node2-Digital"
	"TechStack"				= "Nginx"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
volume_type = "gp2"
ebs_encrypted = true
kms_key_id = "arn:aws:kms:us-east-1:702230634984:key/1768f1e1-0140-4b26-83ba-6e3a4f50a1d0"

#EC2 Instance
ami = "ami-08c80755c260e9d4b"
instance_type = "t3.small"
ec2_region = "us-east-1b"
public_ip_bool = false
key_name = "Digital-Node2-Key"
efs_sg = ["sg-010670cd25f4a1a7c"]
subnet_id = "subnet-076a071fa0723c80e"
ec2_tags = {
	"ApplicationName"		= "Digital"
	"Automated"				= "True"
	"BackupPlan"			= "Weekly"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09052024"
	"DataClassification"	= "Low"
	"Department"			= "DGT"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09052024"
	"Name"					= "EC2-Nginx-Node2-Digital"
	"TechStack"				= "Nginx"
	"Usage"					= "Project"
	"Version"				= "1.0"
	"WeekendShutdown"		= "False"
}
instance_initiated_shutdown_behavior = "stop"
private_ip        =     "10.153.19.200"

#Security Group
sg_name				= "digital-nginx-node2-sg-stage"
sg_description		= "Security group for Nginx node2"
vpc_id				= "vpc-0051d323df13c7db3"
sg_tags				= {
	"ApplicationName"		= "Digital"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09052024"
	"DataClassification"	= "Low"
	"Department"			= "DGT"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09052024"
	"Name"					= "digital-nginx-node2-sg-stage"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
  sg_ingress_rules  = {
  "1" = {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = ["10.153.18.0/24"]
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
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = ["10.153.19.0/24"]
    description = "EFS mount target"
  },
  "4" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["10.153.19.0/24"]
    description = "HTTP"
  },
  "5" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.217.33.72/31"]
    description = "SSH"
  },
  "6" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["172.21.150.0/24"]
    description = "HTTP"
  },
  "7" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["10.153.16.0/24"]
    description = "HTTPS from public ALB"
  },
  "8" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["10.64.0.0/16"]
    description = "SSH From Palo VPN"
  },
  "9" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["10.153.10.219/32"]
    description = "Verinext-SharedPrvConnect"
  },
  "10" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["203.62.174.143/32"]
    description = "HTTPS From Virtusa"
  },
  "11" = {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
	cidr_blocks = ["10.153.10.219/32"]
    description = "Verinext-SharedPrvConnect"
  },
  "12" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["10.33.99.102/32"]
    description = "SSH From Devlsys7"
  },
  "13" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["10.153.10.12/32"]
    description = "SSH"
  },
  "14" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["203.62.174.143/32"]
    description = "SSH From Virtusa"
  },
  "15" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["10.153.17.0/24"]
    description = "HTTPS from Public ALB"
  },
  "16" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["10.141.0.0/16"]
    description = "SSH From FMG Network"
  },
  "17" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["10.153.18.0/24"]
    description = "HTTP"
  },
  "18" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["172.21.148.0/24"]
    description = "SSH"
  },
  "19" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["10.141.0.0/16"]
    description = "SSH"
  },
  "20" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["172.21.148.0/24"]
    description = "HTTP"
  },
}
