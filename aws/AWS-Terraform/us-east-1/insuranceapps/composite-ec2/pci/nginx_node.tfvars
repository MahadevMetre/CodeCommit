#ROOT storage block
ebs_enabled = false
ebs_size = 30
ebs_tags = {
	"ApplicationName"		= "InsuranceApps"
	"Automated"				= "True"
	"BackupPlan"			= "Weekly"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "10112021"
	"DataClassification"	= "PCI"
	"Department"			= "IAPPS"
	"Infrastructure"		= "False"
	"InstanceID"			= "i-07567132b0c638a90"
	"LastUpdated"			= "07202023"
	"Name"					= "EC2-Nginx-Node-InsuranceApps"
	"TechStack"				= "Nginx"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
volume_type = "gp2"
ebs_encrypted = true
kms_key_id = "arn:aws:kms:us-east-1:601751840347:key/424d8df7-29d0-42fc-b424-1785a210c6c3"

#EC2 Instance
ami = "ami-07536e8a2d7699a79"
instance_type = "c4.xlarge"
ec2_region = "us-east-1b"
public_ip_bool = false
key_name = "ec2-rhel-kp-pci"
efs_sg = ["sg-05ea83d9356fa9299"]
subnet_id = "subnet-0a797df6e7dcae3db"
ec2_tags = {
	"ApplicationName"		= "InsuranceApps"
	"Automated"				= "True"
	"BackupPlan"			= "Weekly"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "10112021"
	"DataClassification"	= "PCI"
	"Department"			= "IAPPS"
	"Infrastructure"		= "False"
	"LastUpdated"			= "07202023"
	"Name"					= "EC2-Nginx-Node-InsuranceApps"
	"TechStack"				= "Nginx"
	"Usage"					= "Project"
	"Version"				= "1.0"
	"WeekendShutdown"		= "False"
}
instance_initiated_shutdown_behavior = "stop"

#Security Group
sg_name				= "insuranceapps-nginx-node-sg-pci"
sg_description		= "Security group for Nginx node"
vpc_id				= "vpc-00bd4d2758879b1e0"
sg_tags				= {
	"ApplicationName"		= "InsuranceApps"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "10112021"
	"DataClassification"	= "PCI"
	"Department"			= "IAPPS"
	"Infrastructure"		= "False"
	"LastUpdated"			= "08232023"
	"Name"					= "insuranceapps-nginx-node-sg-pci"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
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
	cidr_blocks = ["10.153.30.0/23"]
    description = "HTTPS From Private Subnets PCI"
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
    cidr_blocks = ["10.153.30.0/23"]
    description = "NFS From Private Subnets PCI"
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
  },
  "15" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["202.168.90.114/32"]
    description = "HTTPS From Virtusa Navalur Tunnel"
  }
}