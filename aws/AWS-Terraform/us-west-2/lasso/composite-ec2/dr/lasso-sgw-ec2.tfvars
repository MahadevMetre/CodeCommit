#ROOT storage block
ebs_enabled = true
ebs_size = 80
ebs2_size = 150
volume_type = "gp3"
ebs_encrypted = true
kms_key_id = "arn:aws:kms:us-west-2:214946096060:key/54aea680-6661-4008-a514-516ddcf686aa"

#EC2 Instance
ami = "ami-0aa80e1f5cd5b99be"
instance_type = "m6i.xlarge"
ec2_region = "us-west-2a"
public_ip_bool = false
key_name = "ec2-rhel-kp-dr"
subnet_id = "subnet-0b927d24fec28d40b"
ec2_tags = {
    "ApplicationName" = "Lasso"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "mfaizudeen"
	"CreatedOn" = "02282023"
	"DataClassification" = "Low"
	"Department" = "LSO"
	"Infrastructure" = "False"
	"LastUpdated" = "02282023"
	"TechStack" = "AWS"
	"Usage" = "Project"
	"Version" = "1.0"
    "Name"	= "lasso-sgw-ec2-dr"
}
instance_initiated_shutdown_behavior = "stop"
private_ip        =     "10.153.42.123"

#Security Group
sg_name				= "lasso-sgw-ec2-sg-dr"
sg_description		= "Security group for Lasso SGW EC2 DR"
vpc_id				= "vpc-0e79e26eb537504d0"
sg_tags				= {
    "ApplicationName" = "Lasso"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "mfaizudeen"
	"CreatedOn" = "02282023"
	"DataClassification" = "Low"
	"Department" = "LSO"
	"Infrastructure" = "False"
	"LastUpdated" = "02282023"
	"TechStack" = "AWS"
	"Usage" = "Project"
	"Version" = "1.0"
    "Name"	= "lasso-sgw-ec2-sg-dr"
}
  sg_ingress_rules  = {
  "1" = {
    from_port   = 445
    to_port     = 445
    protocol    = "tcp"
    cidr_blocks = ["10.245.212.22/32"]
    description = "SMB From IPS Machine"
  },
  "2" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.64.0.0/16"]
    description = "SSH From Palo VPN"
  },
  "3" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.141.0.0/16"]
    description = "SSH From FMG Network"
  // },
// The following rule should be removed once the storage gateway setup is complete
  // "3" = {
    // from_port   = 80
    // to_port     = 80
    // protocol    = "tcp"
    // cidr_blocks = ["10.64.0.0/16"]
    // description = "HTTP From Palo VPN"
  }
}