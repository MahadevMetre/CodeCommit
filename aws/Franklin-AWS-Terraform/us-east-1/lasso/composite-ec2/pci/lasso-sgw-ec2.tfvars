#ROOT storage block
ebs_enabled = true
ebs_size = 80
ebs2_size = 150
volume_type = "gp3"
ebs_encrypted = true
kms_key_id = "arn:aws:kms:us-east-1:601751840347:key/424d8df7-29d0-42fc-b424-1785a210c6c3"

#EC2 Instance
ami = "ami-05257a1f7eff27687"
instance_type = "m6i.xlarge"
ec2_region = "us-east-1a"
public_ip_bool = false
key_name = "ec2-rhel-kp-pci"
subnet_id = "subnet-0a33ed77fe2cfb6ef"
ec2_tags = {
        "ApplicationName": "Lasso",
		"Automated": "True",
		"BackupPlan": "None",
		"CostCenter": "FMG",
		"CreatedBy": "sbose",
		"CreatedOn": "10062022",
		"DataClassification": "Low",
		"Department": "LSO",
		"Infrastructure": "False",
		"LastUpdated": "06152023",
		"TechStack": "AWS",
		"Usage": "Project",
		"Version": "1.0"
}
instance_initiated_shutdown_behavior = "stop"
private_ip        =     "10.153.30.123"

#Security Group
sg_name				= "lasso-sgw-ec2-sg-pci"
sg_description		= "Security group for Lasso SGW EC2 PCI"
vpc_id				= "vpc-00bd4d2758879b1e0"
sg_tags				= {
        "ApplicationName": "Lasso",
		"Automated": "True",
		"BackupPlan": "None",
		"CostCenter": "FMG",
		"CreatedBy": "sbose",
		"CreatedOn": "10062022",
		"DataClassification": "Low",
		"Department": "LSO",
		"Infrastructure": "False",
		"LastUpdated": "06152023",
		"TechStack": "AWS",
		"Usage": "Project",
		"Version": "1.0"
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
  // "4" = {
    // from_port   = 80
    // to_port     = 80
    // protocol    = "tcp"
    // cidr_blocks = ["10.64.0.0/16"]
    // description = "HTTP From Palo VPN"
  }
}