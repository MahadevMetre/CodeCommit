#ROOT storage block
ebs_enabled = false
ebs_size = 30
volume_type = "gp2"
ebs_encrypted = true
kms_key_id = "arn:aws:kms:us-west-2:214946096060:key/2db229ef-d523-415d-8325-4d7d073c168f"

#EC2 Instance
ami = "ami-0e1fde9c0dc212ff9"
instance_type = "c4.xlarge"
ec2_region = "us-west-2a"
public_ip_bool = false
key_name = "ec2-digital-dr"
efs_sg = ["sg-0e65fd3db25a785e9"]
subnet_id = "subnet-0b927d24fec28d40b"
ec2_tags = {
    "ApplicationName" = "Digital"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "mfaizudeen"
	"CreatedOn" = "03182023"
	"DataClassification" = "None"
	"Department" = "DGT"
	"Infrastructure" = "False"
	"LastUpdated" = "03182023"
	"TechStack" = "Nginx"
	"Usage" = "Project"
	"Version" = "1.0"
	"Name"	= "EC2-Nginx-Node-Digital"
    "Type"	= "EC2 Golden source for digital servers"
}
instance_initiated_shutdown_behavior = "stop"

#Security Group
sg_name				= "digital-nginx-node-sg-dr"
sg_description		= "Security group for Nginx node"
vpc_id				= "vpc-0e79e26eb537504d0"
sg_tags				= {
    "ApplicationName" = "Digital"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "mfaizudeen"
	"CreatedOn" = "03182023"
	"DataClassification" = "None"
	"Department" = "DGT"
	"Infrastructure" = "False"
	"LastUpdated" = "03182023"
	"TechStack" = "AWS"
	"Usage" = "Project"
	"Version" = "1.0"
	"Name"	= "digital-nginx-node-sg-dr"
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
	cidr_blocks = ["10.153.40.0/21"]
    description = "HTTPS For VPC"
  },
  "3" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.64.0.0/16"]
    description = "SSH For Palo VPN"
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
    cidr_blocks = ["10.153.42.0/24"]
    description = "EFS Mount Target For Private Subnet A"
  },
  "6" = {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = ["10.153.43.0/24"]
    description = "EFS Mount Target For Private Subnet B"
  },
  "7" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["10.153.10.219/32"]
    description = "SSH For Shared Connection 3"
  }
}