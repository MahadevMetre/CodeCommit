#ROOT storage block
ebs_enabled = false
ebs_size = 30
ebs_tags = {
	"ApplicationName"		= "InsuranceApps"
	"Automated"				= "True"
	"BackupPlan"			= "Monthly"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09212021"
	"DataClassification"	= "None"
	"Department"			= "IAPPS"
	"Infrastructure"		= "False"
	"InstanceID"			= "i-0e67c3a7ca562a060"
	"LastUpdated"			= "07232023"
	"Name"					= "EC2-JBoss-Admin-InsuranceApps"
	"TechStack"				= "JBoss"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
volume_type = "gp3"
ebs_encrypted = true
kms_key_id = "arn:aws:kms:us-east-1:702230634984:key/e4cd9ef3-fd41-4a9f-b079-0fa7d85d5a09"

#EC2 Instance
ami = "ami-00888307d143f9923"
instance_type = "m6i.large"
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
	"CreatedOn"				= "09212021"
	"DataClassification"	= "None"
	"Department"			= "IAPPS"
	"Infrastructure"		= "False"
	"LastUpdated"			= "07232023"
	"Name"					= "EC2-JBoss-Admin-InsuranceApps"
	"PatchedBy"				= "SSM"
	"QSConfigName-07fbk"	= "FMG-Linux-Patching-STG"
    "QSConfigName-8l8fj"	= "Stage Patch Report"
    "QSConfigName-mam5p"	= "MasterPatchPolicyConfig-ScanInstall-for-StagingAccount"
	"TechStack"				= "JBoss"
	"Type"					= "jboss-admin-adhoc"
	"Usage"					= "Project"
	"Version"				= "1.0"
	"WeekendShutdown"		= "True"
}
instance_initiated_shutdown_behavior = "stop"
private_ip        =     "10.153.19.220"

#Security Group
sg_name				= "insuranceapps-jboss-admin-sg-stage"
sg_description		= "Security group for JBoss admin"
vpc_id				= "vpc-0051d323df13c7db3"
sg_tags				= {
	"ApplicationName"		= "InsuranceApps"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09212021"
	"DataClassification"	= "None"
	"Department"			= "IAPPS"
	"Infrastructure"		= "False"
	"LastUpdated"			= "08222023"
	"Name"					= "insuranceapps-jboss-admin-sg-stage"
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
	cidr_blocks = ["10.153.18.0/23"]
    description = "HTTPS From Private Subnets Stage"
  },
  "5" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["10.64.0.0/16"]
    description = "HTTPS From Palo VPN"
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
	cidr_blocks = ["10.153.10.12/32"]
    description = "SSH For DevOps Server"
  },
  "8" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["10.33.99.102/32"]
    description = "SSH From Devlsys7"
  },
  "9" = {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
	cidr_blocks = ["10.153.18.0/23"]
    description = "NFS From Private Subnets Stage"
  },
  "10" = {
    from_port   = 9990
    to_port     = 9995
    protocol    = "tcp"
	cidr_blocks = ["10.64.0.0/16"]
    description = "JBoss Slave Console From Palo VPN"
  },
  "11" = {
    from_port   = 9990
    to_port     = 9995
    protocol    = "tcp"
	cidr_blocks = ["10.153.18.0/23"]
    description = "Console Access From Private Subnets Dev"
  },
  "12" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["10.217.34.86/31"]
    description = "HTTPS For Captiva 1"
  },
  "13" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["10.217.34.88/31"]
    description = "HTTPS For Captiva 2"
  },
  "14" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["10.153.16.0/22"]
    description = "SSH From VPC"
  },
  "15" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["203.62.174.143/32"]
    description = "HTTPS From Virtusa"
  },
  "16" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["203.62.174.143/32"]
    description = "SSH From Virtusa"
  },
  "17" = {
    from_port   = 9990
    to_port     = 9995
    protocol    = "tcp"
	cidr_blocks = ["203.62.174.143/32"]
    description = "JBoss Slave Console From Virtusa"
  },
  "18" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["202.168.90.114/32"]
    description = "SSH From Virtusa - Navalur tunnel"
  }
}