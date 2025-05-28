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
	"InstanceID"			= "i-04cbc2f709250c894"
	"LastUpdated"			= "07232023"
	"Name"					= "EC2-Nginx-Node-InsuranceApps"
	"TechStack"				= "Nginx"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
volume_type = "gp3"
ebs_encrypted = true
kms_key_id = "arn:aws:kms:us-east-1:116762271881:key/f991debb-2f56-4590-bd49-8245fad06084"

#EC2 Instance
ami = "ami-05be68029aaf1c1ee"
instance_type = "t3.small"
ec2_region = "us-east-1a"
public_ip_bool = false
key_name = "EC2-Dev-key"
efs_sg = ["sg-055fcd6e5bb9d467e"]
subnet_id = "subnet-06291ceaa523f684c"
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
	"QSConfigName-bbmzi"	= "MasterPatchPolicyConfig-ScanInstall-for-DevQAAccount"
	"QSConfigName-nlswz"	= "MasterPatchPolicyConfig-for-DevQAAccount"
	"TechStack"				= "Nginx"
	"Usage"					= "Project"
	"Version"				= "1.0"
	"WeekendShutdown"		= "False"
}
instance_initiated_shutdown_behavior = "stop"

#Security Group
sg_name				= "insuranceapps-nginx-node-sg-dev"
sg_description		= "Security group for Nginx node"
vpc_id				= "vpc-00ff8e33839358d28"
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
	"Name"					= "insuranceapps-nginx-node-sg-dev"
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
	cidr_blocks = ["10.153.14.0/23"]
    description = "HTTPS For Private Subnets Dev"
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
	cidr_blocks = ["10.153.14.0/23"]
    description = "EFS Mount Target For Private Subnets Dev"
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
	cidr_blocks = ["10.153.12.0/22"]
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
  }
}