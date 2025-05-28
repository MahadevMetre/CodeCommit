#ROOT storage block
ebs_enabled = false
ebs_size = 30
volume_type = "gp3"
ebs_encrypted = true
kms_key_id = "arn:aws:kms:us-east-1:702230634984:key/e4cd9ef3-fd41-4a9f-b079-0fa7d85d5a09"

#EC2 Instance
ami = "ami-0e6fc0f5c004575f7"
instance_type = "c6i.large"
ec2_region = "us-east-1b"
public_ip_bool = false
key_name = "EC2-Stage-Key"
efs_sg = ["sg-010670cd25f4a1a7c"]
subnet_id = "subnet-076a071fa0723c80e"
ec2_tags = {
    "ApplicationName" = "DevOps"
    "Automated" = "True"
    "BackupPlan" = "Monthly"
    "CostCenter" = "FMG"
    "CreatedBy" = "sbose"
    "CreatedOn" = "01032023"
    "DataClassification" = "Low"
    "Department" = "DOS"
    "Infrastructure" = "False"
    "LastUpdated" = "06262023"
    "TechStack" = "SerenityBDD"
    "Usage" = "Project"
    "Version" = "1.0"
	"WeekendShutdown" = "True"
}
instance_initiated_shutdown_behavior = "stop"
private_ip        =     "10.153.19.210"

#Route53
r53_zone_id = "Z010407314HT5G1PGDENW"
r53_name = "stage.automation.franklinmadisonds.com"
r53_type = "A"
r53_ttl = "300"

#Security Group
sg_name				= "automation-sg-stage"
sg_description		= "Security group for Automation Server"
vpc_id				= "vpc-0051d323df13c7db3"
sg_tags				= {
    "ApplicationName" = "DevOps"
    "Automated" = "True"
    "BackupPlan" = "Monthly"
    "CostCenter" = "FMG"
    "CreatedBy" = "sbose"
    "CreatedOn" = "01032023"
    "DataClassification" = "Low"
    "Department" = "DOS"
    "Infrastructure" = "False"
    "LastUpdated" = "06262023"
    "TechStack" = "SerenityBDD"
    "Usage" = "Project"
    "Version" = "1.0"
	"WeekendShutdown" = "True"
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
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["203.62.174.143/32"]
    description = "SSH From Virtusa"
  },
  "5" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["203.62.174.143/32"]
    description = "HTTPS From Virtusa"
  }
}