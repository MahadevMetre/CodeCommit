#ROOT storage block
ebs_enabled = false
ebs_size = 250
ebs_tags = {
	"ApplicationName"		= "ELK-Stack"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "sbose"
	"CreatedOn"				= "02152023"
	"DataClassification"	= "Low"
	"Department"			= "ELK"
	"Infrastructure"		= "False"
	"InstanceID"			= "i-066e528b6e546c0f2"
	"LastUpdated"			= "08172023"
	"Name"					= "EC2-ELK-Logstash"
	"TechStack"				= "Logstash and Heartbeat"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
volume_type = "gp3"
ebs_encrypted = true
kms_key_id = "arn:aws:kms:us-east-1:964190570136:key/50362799-ce91-4022-983a-21616865762e"

#EC2 Instance
ami = "ami-0cd7323ab3e63805f"
instance_type = "r6g.xlarge"
ec2_region = "us-east-1a"
public_ip_bool = false
key_name = "ec2-elk-shared"
subnet_id = "subnet-00ff060d1bca76f81"
ec2_tags = {
	"ApplicationName" = "ELK-Stack"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "sbose"
	"CreatedOn" = "02152023"
	"DataClassification" = "Low"
	"Department" = "ELK"
	"Infrastructure" = "False"
	"LastUpdated" = "07242023"
	"Name" = "EC2-ELK-Logstash"
	"PatchedBy" = "SSM"
	"QSConfigName-q68bo" = "MasterPatchPolicyConfig-ScanInstall-for-ProdAccounts"
	"TechStack" = "Logstash and Heartbeat"
	"Usage" = "Project"
	"Version" = "1.0"
}
instance_initiated_shutdown_behavior = "stop"
private_ip        =     "10.153.10.30"

#Security Group
sg_name				= "elk-logstash-sg-shared"
sg_description		= "Security group for Logstash Server"
vpc_id				= "vpc-01befeb7d6fed04cd"
sg_tags				= {
	"ApplicationName" = "ELK-Stack"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "sbose"
	"CreatedOn" = "02152023"
	"DataClassification" = "Low"
	"Department" = "ELK"
	"Infrastructure" = "False"
	"LastUpdated" = "07242023"
	"Name" = "elk-logstash-sg-shared"
	"TechStack" = "Logstash and Heartbeat"
	"Usage" = "Project"
	"Version" = "1.0"
}
  sg_ingress_rules  = {
  "1" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.64.0.0/16"]
    description = "SSH From Palo VPN"
  },
  "2" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.64.0.0/16"]
    description = "HTTPS From Palo VPN"
  },
  "3" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.153.10.12/32"]
    description = "SSH From DevOps Server"
  },
  "4" = {
    from_port   = 5044
    to_port     = 5044
    protocol    = "tcp"
    cidr_blocks = ["10.153.8.0/22"]
    description = "LogStash From Shared VPC"
  },
  "5" = {
    from_port   = 5044
    to_port     = 5044
    protocol    = "tcp"
    cidr_blocks = ["10.153.12.0/22"]
    description = "LogStash From Dev VPC"
  },
  "6" = {
    from_port   = 5044
    to_port     = 5044
    protocol    = "tcp"
    cidr_blocks = ["10.153.16.0/22"]
    description = "LogStash From Stage VPC"
  },
  "7" = {
    from_port   = 5044
    to_port     = 5044
    protocol    = "tcp"
    cidr_blocks = ["10.153.28.0/22"]
    description = "LogStash From PCI VPC"
  },
  "8" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["202.168.90.114/32"]
    description = "HTTPS From Virtusa Navalur Tunnel"
  }
}