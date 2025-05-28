#ROOT storage block
ebs_enabled = false
ebs_size = 30
ebs_tags = {
	"ApplicationName"		= "Digital"
	"Automated"				= "True"
	"BackupPlan"			= "Weekly"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "11262021"
	"DataClassification"	= "PCI"
	"Department"			= "DGT"
	"Infrastructure"		= "False"
	"InstanceID"			= "i-00d0dee3da239807a"
	"LastUpdated"			= "07202023"
	"Name"					= "EC2-JBoss-Slave-Digital"
	"TechStack"				= "JBoss"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
volume_type = "gp2"
ebs_encrypted = true
kms_key_id = "arn:aws:kms:us-east-1:601751840347:key/424d8df7-29d0-42fc-b424-1785a210c6c3"

#EC2 Instance
ami = "ami-09d6ab9e87bac026b"
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
	"CreatedOn"				= "11262021"
	"DataClassification"	= "PCI"
	"Department"			= "DGT"
	"Infrastructure"		= "False"
	"LastUpdated"			= "07202023"
	"Name"					= "EC2-JBoss-Slave-Digital"
	"TechStack"				= "JBoss"
	"Usage"					= "Project"
	"Version"				= "1.0"
	"WeekendShutdown"		= "False"
}
instance_initiated_shutdown_behavior = "stop"
private_ip        =     "10.153.31.33"

#Security Group
sg_name				= "digital-jboss-slave-sg-pci"
sg_description		= "Security group for JBoss slave"
vpc_id				= "vpc-00bd4d2758879b1e0"
sg_tags				= {
	"ApplicationName"		= "Digital"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "11262021"
	"DataClassification"	= "PCI"
	"Department"			= "DGT"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09272023"
	"Name"					= "digital-jboss-slave-sg-pci"
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
	cidr_blocks = ["172.21.148.0/24"]
    description = "HTTPS For Franklin Office Floor 4"
  },
  "3" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["172.21.150.0/24"]
    description = "HTTPS For Franklin Office Floor 4"
  },
  "4" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.64.0.0/16"]
    description = "SSH From Palo VPN"
  },
  "5" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["172.21.148.0/24"]
    description = "SSH For Franklin Office Floor 4"
  },
  "6" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["172.21.150.0/24"]
    description = "SSH For Franklin Office Floor 4"
  },
  "7" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["10.153.10.12/32"]
    description = "SSH For DevOps Server"
  },
  "9" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.153.10.219/32"]
    description = "SSH For Shared Connection 3"
  },
  "10" = {
    from_port   = 9990
    to_port     = 9995
    protocol    = "tcp"
	cidr_blocks = ["10.153.10.219/32"]
    description = "Console Access For Shared Connection 3"
  },
  "11" = {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = ["10.153.30.0/24"]
    description = "EFS Mount Target For Private Subnet A"
  },
  "12" = {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = ["10.153.31.0/24"]
    description = "EFS Mount Target For Private Subnet B"
  },
  "13" = {
    from_port   = 9990
    to_port     = 9995
    protocol    = "tcp"
    cidr_blocks = ["10.64.0.0/16"]
    description = "JBoss Slave Console From Palo VPN"
  },
  "14" = {
    from_port   = 9990
    to_port     = 9995
    protocol    = "tcp"
	cidr_blocks = ["172.21.148.0/24"]
    description = "Console Access For Franklin Office Floor 4"
  },
  "15" = {
    from_port   = 9990
    to_port     = 9995
    protocol    = "tcp"
	cidr_blocks = ["172.21.150.0/24"]
    description = "Console Access For Franklin Office Floor 4"
  },
  "16" = {
    from_port   = 9990
    to_port     = 9995
    protocol    = "tcp"
	cidr_blocks = ["10.153.30.0/24"]
    description = "Console Access For Private Subnet A"
  },
  "17" = {
    from_port   = 9990
    to_port     = 9995
    protocol    = "tcp"
	cidr_blocks = ["10.153.31.0/24"]
    description = "Console Access For Private Subnet B"
  },
  "18" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["10.153.30.0/24"]
    description = "HTTPS For Private Subnet A"
  },
  "19" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["10.153.31.0/24"]
    description = "HTTPS For Private Subnet B"
  },
  "20" = {
    from_port   = 8200
    to_port     = 8200
    protocol    = "tcp"
	cidr_blocks = ["10.153.10.12/32"]
    description = "Log forwarder From DevOps Server"
  },
  "21" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["10.141.0.0/16"]
    description = "HTTPS From FMG Network"
  },
  "22" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["10.141.0.0/16"]
    description = "SSH From FMG Network"
  },
  "23" = {
    from_port   = 9990
    to_port     = 9995
    protocol    = "tcp"
	cidr_blocks = ["10.141.0.0/16"]
    description = "JBoss Slave Console From FMG Network"
  },
  "24" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["10.33.98.128/32"]
    description = "SSH From PRODSYS7"
  },
  "25" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["10.153.10.30/32"]
    description = "HTTPS From ELK Heartbeat Instance"
  }
}