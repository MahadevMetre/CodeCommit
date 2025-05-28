#ROOT storage block
ebs_enabled = false
ebs_size = 30
volume_type = "gp3"
ebs_encrypted = true
kms_key_id = "arn:aws:kms:us-east-1:964190570136:key/50362799-ce91-4022-983a-21616865762e"

#EC2 Instance
ami = "ami-0aa7d40eeae50c9a9"
instance_type = "t3.medium"
ec2_region = "us-east-1a"
public_ip_bool = true
key_name = "ec2-crucible-shared"
subnet_id = "subnet-0f9b865788e13ffb3"
ec2_tags = {
		"ApplicationName": "DevOps",
		"Automated": "True",
		"BackupPlan": "None",
		"CostCenter": "FMG",
		"CreatedBy": "DevOps",
		"CreatedOn": "02032023",
		"DataClassification": "Low",
		"Department": "DOS",
		"Infrastructure": "False",
		"LastUpdated": "06262023",
		"Name": "EC2-Crucible",
		"PatchedBy": "SSM",
		"QSConfigName-q68bo": "MasterPatchPolicyConfig-ScanInstall-for-ProdAccounts",
		"TechStack": "Crucible",
		"Usage": "Project",
		"Version": "1.0"
}
instance_initiated_shutdown_behavior = "stop"
private_ip        =     "10.153.8.100"

#Route53
r53_zone_id = "Z1RLPXFQT7M8OO"
r53_name = "crucible.franklinmadisonds.com"
r53_type = "A"
r53_ttl = "300"

#Security Group
sg_name				= "crucible-sg-shared"
sg_description		= "Security group for Crucible Server"
vpc_id				= "vpc-01befeb7d6fed04cd"
sg_tags				= {
		"ApplicationName": "DevOps",
		"Automated": "True",
		"BackupPlan": "None",
		"CostCenter": "FMG",
		"CreatedBy": "sbose",
		"CreatedOn": "02032023",
		"DataClassification": "Low",
		"Department": "DOS",
		"Infrastructure": "False",
		"LastUpdated": "06262023",
		"Name": "crucible-sg-shared",
		"TechStack": "Crucible",
		"Usage": "Project",
		"Version": "1.0"
}
  sg_ingress_rules  = {
  "1" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.153.10.12/32"]
    description = "HTTPS From DevOps Server"
  },
  "2" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.153.10.12/32"]
    description = "SSH From DevOps Server"
  }
}