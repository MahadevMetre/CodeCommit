#ROOT storage block
ebs_enabled = false
ebs_size = 30
volume_type = "gp2"
ebs_encrypted = true
kms_key_id = "arn:aws:kms:us-west-2:214946096060:key/54aea680-6661-4008-a514-516ddcf686aa"

#EC2 Instance
ami = "ami-0e1fde9c0dc212ff9"
instance_type = "c4.xlarge"
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
	"TechStack" = "Nginx"
	"Usage" = "Project"
	"Version" = "1.0"
    "Name"	= "EC2-Nginx-Node-InsuranceApps"
}
instance_initiated_shutdown_behavior = "stop"

#Security Group
sg_name				= "insuranceapps-nginx-node-sg-dr"
sg_description		= "Security group for Nginx node"
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
	"TechStack" = "Nginx"
	"Usage" = "Project"
	"Version" = "1.0"
    "Name"	= "insuranceapps-nginx-node-sg-dr"
}
  sg_ingress_rules  = {
  "1" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.64.0.0/16"]
    description = "HTTPS From Palo VPN"
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
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["10.153.42.0/23"]
    description = "HTTPS For Private Subnets PCI"
  }
  "5" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.64.0.0/16"]
    description = "SSH From Palo VPN"
  },
  "6" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["172.21.148.0/24"]
    description = "SSH For Franklin Office Floor 4"
  },
  "7" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["172.21.150.0/24"]
    description = "SSH For Franklin Office Floor 4"
  },
  "8" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["10.153.10.12/32"]
    description = "SSH For DevOps Server"
  },
  "9" = {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = ["10.153.42.0/23"]
    description = "EFS Mount Target For Private Subnets PCI"
  }
  "10" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["10.153.10.219/32"]
    description = "SSH For Shared Connection 3"
  },
  "11" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["172.21.144.0/24"]
    description = "HTTPS For Franklin Office Floor 1"
  },
  "12" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["172.21.152.0/24"]
    description = "HTTPS For Franklin Office Floor 5"
  },
  "13" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["10.141.0.0/16"]
    description = "HTTPS From FMG Network"
  },
  "14" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["10.141.0.0/16"]
    description = "SSH From FMG Network"
  }
}