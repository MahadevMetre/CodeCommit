#ROOT storage block
ebs_enabled = false
ebs_size = 30
ebs_tags = {
	"ApplicationName"		= "InsuranceApps"
	"Automated"				= "True"
	"BackupPlan"			= "Monthly"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09142021"
	"DataClassification"	= "None"
	"Department"			= "IAPPS"
	"Infrastructure"		= "False"
	"InstanceID"			= "i-0bc8496623933bb6b"
	"LastUpdated"			= "07232023"
	"Name"					= "EC2-Nginx-Node-InsuranceApps"
	"TechStack"				= "Nginx"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
volume_type = "gp3"
ebs_encrypted = true
kms_key_id = "arn:aws:kms:us-east-1:702230634984:key/e4cd9ef3-fd41-4a9f-b079-0fa7d85d5a09"

#EC2 Instance
ami = "ami-06e05f2cf803971f8"
instance_type = "t3.small"
ec2_region = "us-east-1b"
public_ip_bool = false
key_name = "EC2-Stage-Key"
efs_sg = ["sg-034d246155f950519"]
subnet_id = "subnet-076a071fa0723c80e"
ec2_tags = {
	"ApplicationName"		= "InsuranceApps"
	"Automated"				= "True"
	"BackupPlan"			= "Monthly"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09142021"
	"DataClassification"	= "None"
	"Department"			= "IAPPS"
	"Infrastructure"		= "False"
	"LastUpdated"			= "07232023"
	"Name"					= "EC2-Nginx-Node-InsuranceApps"
	"PatchedBy"				= "SSM"
	"QSConfigName-07fbk"	= "FMG-Linux-Patching-STG"
    "QSConfigName-8l8fj"	= "Stage Patch Report"
    "QSConfigName-mam5p"	= "MasterPatchPolicyConfig-ScanInstall-for-StagingAccount"
	"TechStack"				= "Nginx"
	"Usage"					= "Project"
	"Version"				= "1.0"
	"WeekendShutdown"		= "False"
}
instance_initiated_shutdown_behavior = "stop"

#Security Group
sg_name				= "insuranceapps-nginx-node-sg-stage"
sg_description		= "Security group for Nginx node"
vpc_id				= "vpc-0051d323df13c7db3"
sg_tags				= {
	"ApplicationName"		= "InsuranceApps"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09142021"
	"DataClassification"	= "None"
	"Department"			= "IAPPS"
	"Infrastructure"		= "False"
	"LastUpdated"			= "07232023"
	"Name"					= "insuranceapps-nginx-node-sg-stage"
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
	cidr_blocks = ["10.153.18.0/23"]
    description = "HTTPS For Private Subnets Stage"
  }
  "3" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["10.64.0.0/16"]
    description = "SSH From Palo VPN"
  },
  "4" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["10.153.10.12/32"]
    description = "SSH For DevOps Server"
  },
  "5" = {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
	cidr_blocks = ["10.153.18.0/23"]
    description = "EFS Mount Target For Private Subnets Stage"
  },
  "6" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["10.141.0.0/16"]
    description = "HTTPS From FMG Network"
  },
  "7" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["10.141.0.0/16"]
    description = "SSH From FMG Network"
  },
  "8" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["10.153.16.0/22"]
    description = "SSH From VPC"
  },
  "9" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["203.62.174.143/32"]
    description = "HTTPS From Virtusa"
  },
  "10" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["203.62.174.143/32"]
    description = "SSH From Virtusa"
  },
  "11" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["10.153.10.219/32"]
    description = "Verinext-clafontant-Shared Priv Connnect instance"
  },
  "12" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["202.168.90.114/32"]
    description = "HTTPS From Virtusa Navalur Tunnel"
  },
  "13" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["202.168.90.114/32"]
    description = "SSH From Virtusa Navalur Tunnel"
  },
  "14" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["10.153.10.30/32"]
    description = "HTTPS From Heartbeat Instance"
  },
  "15" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["10.163.52.44/32"]
    description = "TEST-TBD-Charles L.-AWSAD server"
  },
  "16" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["172.21.148.0/24", "172.21.152.0/24"]
    description = ""
  },
  "17" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["172.21.150.0/24"]
    description = "Franklin Office - 7th Floor"
  }
}