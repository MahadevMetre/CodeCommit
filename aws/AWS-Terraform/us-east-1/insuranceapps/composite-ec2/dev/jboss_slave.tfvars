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
	"InstanceID"			= "i-0fb0e3f3991d79e76"
	"LastUpdated"			= "07232023"
	"Name"					= "EC2-JBoss-Slave-InsuranceApps"
	"TechStack"				= "JBoss"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
volume_type = "gp3"
ebs_encrypted = true
kms_key_id = "arn:aws:kms:us-east-1:116762271881:key/f991debb-2f56-4590-bd49-8245fad06084"

#EC2 Instance
ami = "ami-09662f95df2af0aeb"
instance_type = "c6i.large"
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
	"Name"					= "EC2-JBoss-Slave-InsuranceApps"
	"PatchedBy"				= "SSM"
	"QSConfigName-bbmzi"	= "MasterPatchPolicyConfig-ScanInstall-for-DevQAAccount"
	"QSConfigName-nlswz"	= "MasterPatchPolicyConfig-for-DevQAAccount"
	"TechStack"				= "JBoss"
	"Usage"					= "Project"
	"Version"				= "1.0"
	"WeekendShutdown"		= "False"
}
instance_initiated_shutdown_behavior = "stop"

#Security Group
sg_name				= "insuranceapps-jboss-slave-sg-dev"
sg_description		= "Security group for JBoss slave"
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
	"LastUpdated"			= "08222023"
	"Name"					= "insuranceapps-jboss-slave-sg-dev"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
  sg_ingress_rules  = {
  "1" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["10.141.0.0/16"]
    description = "HTTPS From FMG Network"
  },
  "2" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["10.141.0.0/16"]
    description = "SSH From FMG Network"
  },
  "3" = {
    from_port   = 9990
    to_port     = 9995
    protocol    = "tcp"
	cidr_blocks = ["10.141.0.0/16"]
    description = "JBoss Slave Console From FMG Network"
  },
  "4" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["10.64.0.0/16"]
    description = "HTTPS From Palo VPN"
  },
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
	cidr_blocks = ["10.33.99.102/32"]
    description = "SSH From Devlsys7"
  },
  "7" = {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
	cidr_blocks = ["10.153.14.0/23"]
    description = "NFS From Private Subnets Dev"
  },
  "8" = {
    from_port   = 9990
    to_port     = 9995
    protocol    = "tcp"
	cidr_blocks = ["10.64.0.0/16"]
    description = "JBoss Slave Console From Palo VPN"
  },
  "9" = {
    from_port   = 9990
    to_port     = 9995
    protocol    = "tcp"
	cidr_blocks = ["10.153.14.0/23"]
    description = "Console Access From Private Subnets Dev"
  },
  "10" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["10.245.208.111/32"]
    description = "HTTPS For GPS Windows Server"
  },
  "11" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["10.217.33.70/31"]
    description = "HTTPS For WebLogic 1"
  },
  "12" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["10.217.33.72/31"]
    description = "HTTPS For WebLogic 2"
  },
  "13" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["10.217.33.58/32"]
    description = "HTTPS For WebLogic LB"
  },
  "14" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["10.217.33.116/32"]
    description = "HTTPS For Captiva"
  },
  "15" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["10.153.14.0/23"]
    description = "HTTPS From Private Subnets Dev"
  },
  "16" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["10.153.12.0/22"]
    description = "SSH From VPC"
  },
  "17" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["203.62.174.143/32"]
    description = "HTTPS From Virtusa"
  },
  "18" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["203.62.174.143/32"]
    description = "SSH From Virtusa"
  },
  "19" = {
    from_port   = 9990
    to_port     = 9995
    protocol    = "tcp"
	cidr_blocks = ["203.62.174.143/32"]
    description = "JBoss Slave Console From Virtusa"
  },
  "20" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["10.153.10.12/32"]
    description = "SSH From DevOps Server"
  },
  "21" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["202.168.90.114/32"]
    description = "HTTPS From Virtusa Navalur Tunnel"
  },
  "22" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["202.168.90.114/32"]
    description = "SSH From Virtusa Navalur Tunnel"
  },
  "23" = {
    from_port   = 9990
    to_port     = 9995
    protocol    = "tcp"
	cidr_blocks = ["202.168.90.114/32"]
    description = "JBoss Slave Console From Virtusa Navalur Tunnel"
  },
  "24" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["10.153.10.30/32"]
    description = "HTTPS From ELK Heartbeat Instance"
  },
  "25" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["10.153.10.219/32"]
    description = "Verinext-clafontant-Shared Priv Connnect instance"
  }
}