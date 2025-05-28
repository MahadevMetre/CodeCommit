#ROOT storage block
ebs_enabled = false
ebs_size = 30
ebs_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09182024"
	"DataClassification"	= "Low"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"InstanceID"			= "T B U"
	"LastUpdated"			= "09182024"
	"Name"					= "EC2-RHEL-RML-QA"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
volume_type = "gp3"
ebs_encrypted = true
kms_key_id = "arn:aws:kms:us-east-1:116762271881:key/39243139-80ea-4544-a28a-99fd8bb3bf86"

#EC2 Instance
ami = "ami-0ca1e5a08f58aba4b"
instance_type = "c6i.xlarge" 
ec2_region = "us-east-1a"
public_ip_bool = false
key_name = "fmg-schrute-qa"
efs_sg = ["sg-03d46e883203d130d"]
subnet_id = "subnet-059a28296ee46f82f"
ec2_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09182024"
	"DataClassification"	= "Low"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09182024"
	"Name"					= "EC2-RHEL-RML-QA"
	"TechStack"				= "AWS"
	"Type"					= "adhoc"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
instance_initiated_shutdown_behavior = "stop"
private_ip        =     "10.153.22.123"

#Security Group
sg_name				= "fmg-pycharm-efs-mount-sg-qa"
sg_description		= "Security group for attaching to pycharm server for mounting efs created for serverless projects"
vpc_id				= "vpc-00f27e42f4b836922"
sg_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09182024"
	"DataClassification"	= "Low"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09182024"
	"Name"					= "fmg-pycharm-efs-mount-sg-qa"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
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
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.153.10.12/32"]
    description = "SSH From DevOps Server"
  },
  "3" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.153.18.164/32"]
    description = "SSH From CrushFTP Instance 1 For EFT"
  },
  "4" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.153.19.245/32"]
    description = "SSH From CrushFTP Instance 2 For EFT"
  }
}