#ROOT storage block
ebs_enabled = false
ebs_size = 30
ebs_tags = {
	"ApplicationName"		= "SonarQube"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "11212022"
	"DataClassification"	= "Low"
	"Department"			= "DOS"
	"Infrastructure"		= "False"
	"InstanceID"			= "i-04def741b69a46239"
	"LastUpdated"			= "07122023"
	"Name"					= "EC2-SonarQube"
	"TechStack"				= "SonarQube"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
volume_type = "gp3"
ebs_encrypted = true
kms_key_id = "arn:aws:kms:us-east-1:964190570136:key/50362799-ce91-4022-983a-21616865762e"

#EC2 Instance
ami = "ami-0b0dcb5067f052a63"
instance_type = "t3.medium"
ec2_region = "us-east-1a"
public_ip_bool = false
key_name = "ec2-sonarqube-shared"
subnet_id = "subnet-00ff060d1bca76f81"
ec2_tags = {
    "ApplicationName" = "SonarQube"
    "Automated" = "True"
    "BackupPlan" = "None"
    "CostCenter" = "FMG"
    "CreatedBy" = "DevOps"
    "CreatedOn" = "11212022"
    "DataClassification" = "Low"
    "Department" = "DOS"
    "Infrastructure" = "False"
    "LastUpdated" = "07122023"
    "Name" = "EC2-SonarQube"
    "PatchedBy" = "SSM"
    "QSConfigName-q68bo" = "MasterPatchPolicyConfig-ScanInstall-for-ProdAccounts"
    "TechStack" = "SonarQube"
    "Usage" = "Project"
    "Version" = "1.0"
}
instance_initiated_shutdown_behavior = "stop"
private_ip        =     "10.153.10.200"

#Route53
r53_zone_id = "Z1RLPXFQT7M8OO"
r53_name = "sonarqube.franklinmadisonds.com"
r53_type = "A"
r53_ttl = "300"

#Security Group
sg_name				= "sonarqube-sg-shared"
sg_description		= "Security group for SonarQube Server"
vpc_id				= "vpc-01befeb7d6fed04cd"
sg_tags				= {
    "ApplicationName" = "SonarQube"
    "Automated" = "True"
    "BackupPlan" = "None"
    "CostCenter" = "FMG"
    "CreatedBy" = "DevOps"
    "CreatedOn" = "11212022"
    "DataClassification" = "Low"
    "Department" = "DOS"
    "Infrastructure" = "False"
    "LastUpdated" = "06272023"
    "Name" = "sonarqube-sg-shared"
    "TechStack" = "SonarQube"
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
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.153.10.12/32"]
    description = "HTTPS From DevOps Server"
  },
  "4" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.153.10.12/32"]
    description = "SSH From DevOps Server"
  },
  "5" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["203.62.174.143/32"]
    description = "HTTPS From Virtusa"
  },
  "6" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["202.168.90.114/32"]
    description = "HTTPS From Virtusa Navalur Tunnel"
  }
}