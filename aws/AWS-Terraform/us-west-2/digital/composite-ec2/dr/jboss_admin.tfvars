#ROOT storage block
ebs_enabled = false
ebs_size = 30
volume_type = "gp2"
ebs_encrypted = true
kms_key_id = "arn:aws:kms:us-west-2:214946096060:key/2db229ef-d523-415d-8325-4d7d073c168f"

#EC2 Instance
ami = "ami-0d9135304ae48c808"
instance_type = "c4.xlarge"
ec2_region = "us-west-2a"
public_ip_bool = false
key_name = "ec2-digital-dr"
efs_sg = ["sg-0e65fd3db25a785e9"]
subnet_id = "subnet-0b927d24fec28d40b"
ec2_tags = {
    "ApplicationName" = "Digital"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "mfaizudeen"
	"CreatedOn" = "03182023"
	"DataClassification" = "None"
	"Department" = "DGT"
	"Infrastructure" = "False"
	"LastUpdated" = "03182023"
	"TechStack" = "JBoss"
	"Usage" = "Project"
	"Version" = "1.0"
	"Name"	= "EC2-JBoss-Admin-Digital"
    "Type"	= "jboss-admin-adhoc"
}
instance_initiated_shutdown_behavior = "stop"
private_ip        =     "10.153.42.34"

#Security Group
sg_name				= "digital-jboss-admin-sg-dr"
sg_description		= "Security group for JBoss admin"
vpc_id				= "vpc-0e79e26eb537504d0"
sg_tags				= {
    "ApplicationName" = "Digital"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "mfaizudeen"
	"CreatedOn" = "03182023"
	"DataClassification" = "None"
	"Department" = "DGT"
	"Infrastructure" = "False"
	"LastUpdated" = "03182023"
	"TechStack" = "AWS"
	"Usage" = "Project"
	"Version" = "1.0"
	"Name"	= "digital-jboss-admin-sg-dr"
}
  sg_ingress_rules  = {
  "1" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.64.0.0/16"]
    description = "HTTPS For Palo VPN"
  },
  "2" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["172.21.148.0/24"]
    description = "HTTPS For Franklin Office Floor 4"
  },
  "3" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["172.21.150.0/24"]
    description = "HTTPS For Franklin Office Floor 4"
  },
  "4" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.64.0.0/16"]
    description = "SSH For Palo VPN"
  },
  "5" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["172.21.148.0/24"]
    description = "SSH For Franklin Office Floor 4"
  },
  "6" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["172.21.150.0/24"]
    description = "SSH For Franklin Office Floor 4"
  },
  "7" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["10.153.10.12/32"]
    description = "SSH For DevOps Server"
  },
  "8" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["10.219.98.128/32"]
    description = "SSH for PRODSYS7"
  },
  "9" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.153.10.219/32"]
    description = "SSH For Shared Connection 3"
  },
  "10" = {
    from_port   = 9990
    to_port     = 9995
    protocol    = "tcp"
	cidr_blocks = ["10.153.10.219/32"]
    description = "Console Access For Shared Connection 3"
  },
  "11" = {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = ["10.153.42.0/24"]
    description = "EFS Mount Target For Private Subnet A"
  },
  "12" = {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = ["10.153.43.0/24"]
    description = "EFS Mount Target For Private Subnet B"
  },
  "13" = {
    from_port   = 9990
    to_port     = 9995
    protocol    = "tcp"
    cidr_blocks = ["10.64.0.0/16"]
    description = "Console Access For Palo VPN"
  },
  "14" = {
    from_port   = 9990
    to_port     = 9995
    protocol    = "tcp"
	cidr_blocks = ["172.21.148.0/24"]
    description = "Console Access For Franklin Office Floor 4"
  },
  "15" = {
    from_port   = 9990
    to_port     = 9995
    protocol    = "tcp"
	cidr_blocks = ["172.21.150.0/24"]
    description = "Console Access For Franklin Office Floor 4"
  },
  "16" = {
    from_port   = 9990
    to_port     = 9995
    protocol    = "tcp"
	cidr_blocks = ["10.153.42.0/24"]
    description = "Console Access For Private Subnet A"
  },
  "17" = {
    from_port   = 9990
    to_port     = 9995
    protocol    = "tcp"
	cidr_blocks = ["10.153.43.0/24"]
    description = "Console Access For Private Subnet B"
  },
  "18" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["10.153.42.0/24"]
    description = "HTTPS For Private Subnet A"
  },
  "19" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["10.153.43.0/24"]
    description = "HTTPS For Private Subnet B"
  }
}
