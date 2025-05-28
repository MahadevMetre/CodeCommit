#ROOT storage block
ebs_enabled = false
ebs_size = 30
ebs_tags = {
	"ApplicationName"		= "Digital"
	"Automated"				= "True"
	"BackupPlan"			= "Weekly"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "08032022"
	"DataClassification"	= "PCI"
	"Department"			= "DGT"
	"Infrastructure"		= "False"
	"InstanceID"			= "i-0b1b40d95dee45f2a"
	"LastUpdated"			= "07202023"
	"Name"					= "EC2-Nginx-Node-Digital"
	"TechStack"				= "Nginx"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
volume_type = "gp2"
ebs_encrypted = true
kms_key_id = "arn:aws:kms:us-east-1:601751840347:key/424d8df7-29d0-42fc-b424-1785a210c6c3"

#EC2 Instance
ami = "ami-02a2946746dbe31ac"
instance_type = "c4.xlarge"
ec2_region = "us-east-1b"
public_ip_bool = false
key_name = "ec2-rhel-kp-pci"
efs_sg = ["sg-08a9862a9edd0f91a"]
subnet_id = "subnet-0a797df6e7dcae3db"
ec2_tags = {
	"ApplicationName"		= "Digital"
	"Automated"				= "True"
	"BackupPlan"			= "Weekly"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "08032022"
	"DataClassification"	= "PCI"
	"Department"			= "DGT"
	"Infrastructure"		= "False"
	"LastUpdated"			= "07202023"
	"Name"					= "EC2-Nginx-Node-Digital"
	"TechStack"				= "Nginx"
	"Usage"					= "Project"
	"Version"				= "1.0"
	"WeekendShutdown"		= "False"
}
instance_initiated_shutdown_behavior = "stop"
private_ip        =     "10.153.31.30"

#Security Group
sg_name				= "digital-nginx-node-sg-pci"
sg_description		= "Security group for Nginx node"
vpc_id				= "vpc-00bd4d2758879b1e0"
sg_tags				= {
	"ApplicationName"		= "Digital"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "08032022"
	"DataClassification"	= "PCI"
	"Department"			= "DGT"
	"Infrastructure"		= "False"
	"LastUpdated"			= "07202023"
	"Name"					= "digital-nginx-node-sg-pci"
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
	cidr_blocks = ["10.153.28.0/22"]
    description = "HTTPS From PCI VPC"
  },
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
    cidr_blocks = ["10.153.30.0/24"]
    description = "EFS Mount Target For Private Subnet A"
  },
  "6" = {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = ["10.153.31.0/24"]
    description = "EFS Mount Target For Private Subnet B"
  },
  "7" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["10.153.10.219/32"]
    description = "SSH For Shared Connection 3"
  },
  "8" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["10.141.0.0/16"]
    description = "HTTPS From FMG Network"
  },
  "9" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["10.141.0.0/16"]
    description = "SSH From FMG Network"
  },
  "10" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["10.153.10.30/32"]
    description = "HTTPS From ELK Heartbeat Instance"
  }
}