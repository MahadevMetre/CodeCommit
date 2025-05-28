#ROOT storage block
ebs_enabled = false
ebs_size = 30
volume_type = "gp2"
ebs_encrypted = true
kms_key_id = "arn:aws:kms:us-west-2:214946096060:key/54aea680-6661-4008-a514-516ddcf686aa"

#EC2 Instance
ami = "ami-0fed4299e72e2b779"
instance_type = "c6i.xlarge"
ec2_region = "us-west-2a"
public_ip_bool = false
key_name = "ec2-iapps-dr"
efs_sg = ["sg-0e63438527d27bf3c"]
subnet_id = "subnet-0b927d24fec28d40b"
ec2_tags = {
    "ApplicationName" = "InsuranceApps"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "mfaizudeen"
	"CreatedOn" = "01162023"
	"DataClassification" = "Low"
	"Department" = "IAP"
	"Infrastructure" = "False"
	"LastUpdated" = "01162023"
	"TechStack" = "JBoss"
	"Usage" = "Project"
	"Version" = "1.0"
    "Name"	= "EC2-JBoss-Admin-InsuranceApps"
    "Type"	= "jboss-admin-adhoc"
}
instance_initiated_shutdown_behavior = "stop"
private_ip        =     "10.153.42.115"

#Security Group
sg_name				= "insuranceapps-jboss-admin-sg-dr"
sg_description		= "Security group for JBoss admin"
vpc_id				= "vpc-0e79e26eb537504d0"
sg_tags				= {
    "ApplicationName" = "InsuranceApps"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "mfaizudeen"
	"CreatedOn" = "01162023"
	"DataClassification" = "Low"
	"Department" = "IAP"
	"Infrastructure" = "False"
	"LastUpdated" = "02052023"
	"TechStack" = "JBoss"
	"Usage" = "Project"
	"Version" = "1.0"
    "Name"	= "insuranceapps-jboss-admin-sg-dr"
}
  sg_ingress_rules  = {
  "1" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["10.245.208.111/32"]
    description = "HTTPS For GPS Windows Server"
  },
  "2" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["10.219.33.31/32"]
    description = "HTTPS For WebLogic 1"
  },
  "3" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["10.219.33.32/32"]
    description = "HTTPS For WebLogic 2"
  },
  "4" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["10.153.42.0/24"]
    description = "HTTPS For Private Subnet A"
  },
  "5" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["10.153.43.0/24"]
    description = "HTTPS For Private Subnet B"
  },
  "6" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.64.0.0/16"]
    description = "HTTPS From Palo VPN"
  },
  "7" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["172.21.148.0/24"]
    description = "HTTPS For Franklin Office Floor 4"
  },
  "8" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["172.21.150.0/24"]
    description = "HTTPS For Franklin Office Floor 4"
  },
  "9" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.64.0.0/16"]
    description = "SSH From Palo VPN"
  },
  "10" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["172.21.148.0/24"]
    description = "SSH For Franklin Office Floor 4"
  },
  "11" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["172.21.150.0/24"]
    description = "SSH For Franklin Office Floor 4"
  },
  "12" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["10.153.10.12/32"]
    description = "SSH For DevOps Server"
  },
  "13" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["10.141.212.125/32"]
    description = "SSH From Prodcbu7"
  },
  "14" = {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = ["10.153.42.0/24"]
    description = "EFS Mount Target For Private Subnet A"
  },
  "15" = {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = ["10.153.43.0/24"]
    description = "EFS Mount Target For Private Subnet B"
  },
  "16" = {
    from_port   = 9990
    to_port     = 9995
    protocol    = "tcp"
    cidr_blocks = ["10.64.0.0/16"]
    description = "JBoss Slave Console From Palo VPN"
  },
  "17" = {
    from_port   = 9990
    to_port     = 9995
    protocol    = "tcp"
	cidr_blocks = ["172.21.148.0/24"]
    description = "Console Access For Franklin Office Floor 4"
  },
  "18" = {
    from_port   = 9990
    to_port     = 9995
    protocol    = "tcp"
	cidr_blocks = ["172.21.150.0/24"]
    description = "Console Access For Franklin Office Floor 4"
  },
  "19" = {
    from_port   = 9990
    to_port     = 9995
    protocol    = "tcp"
	cidr_blocks = ["10.153.42.0/24"]
    description = "Console Access For Private Subnet A"
  },
  "20" = {
    from_port   = 9990
    to_port     = 9995
    protocol    = "tcp"
	cidr_blocks = ["10.153.43.0/24"]
    description = "Console Access For Private Subnet B"
  },
  "21" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["10.219.33.82/31"]
    description = "HTTPS For Captiva 1"
  },
  "22" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["10.219.33.84/32"]
    description = "HTTPS For Captiva 2"
  },
  "23" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["10.219.33.67/32"]
    description = "HTTPS For Captiva 3"
  },
  "24" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["10.219.33.37/32"]
    description = "SSH For EFT 1"
  },
  "25" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["10.219.33.38/32"]
    description = "SSH For EFT 2"
  },
  "26" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["10.153.10.219/32"]
    description = "SSH For Shared Connection 3"
  },
  "27" = {
    from_port   = 9990
    to_port     = 9995
    protocol    = "tcp"
	cidr_blocks = ["10.153.10.219/32"]
    description = "Console Access For Shared Connection 3"
  },
  "28" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["172.21.144.0/24"]
    description = "HTTPS For Franklin Office Floor 1"
  },
  "29" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["172.21.152.0/24"]
    description = "HTTPS For Franklin Office Floor 5"
  },
  "30" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["10.141.0.0/16"]
    description = "HTTPS From FMG Network"
  },
  "31" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["10.141.0.0/16"]
    description = "SSH From FMG Network"
  },
  "32" = {
    from_port   = 9990
    to_port     = 9995
    protocol    = "tcp"
	cidr_blocks = ["10.141.0.0/16"]
    description = "JBoss Slave Console From FMG Network"
  },
  "33" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["10.141.212.125/32"]
    description = "HTTPS From Prodcbu7"
  },
  "34" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["10.33.98.128/32"]
    description = "SSH From Prodsys7"
  }
}