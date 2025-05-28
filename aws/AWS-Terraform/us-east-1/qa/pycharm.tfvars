ec2_region          = "us-east-1"
availability_zone   = "us-east-1a"
ami_id              = "ami-0d970a99d14156c94"
instance_type       = "c6i.xlarge"
public_ip_bool      = false
key_name            = "fmg-schrute-qa"
subnet_id           = "subnet-059a28296ee46f82f"
private_ip          = "10.153.22.123"
disable_api_termination = true
root_volume_size    = 30
root_volume_type    = "gp3"
ebs_volume_size     = 30
ebs_volume_type     = "gp3"
attach_ebs_volume   = false
ebs_device_name     = "/dev/sdh"
sg_name             = "fmg-pycharm-efs-mount-sg-qa"
sg_description      = "Security group for attaching to pycharm server"
vpc_id              = "vpc-00f27e42f4b836922"

sg_ingress_rules = [
  {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.64.0.0/16"]
    description = "SSH From Palo VPN"
  },
  {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.153.10.12/32"]
    description = "SSH From DevOps Server"
  },
  {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.153.18.164/32"]
    description = "SSH From CrushFTP Instance 1 For EFT"
  },
  {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.153.19.245/32"]
    description = "SSH From CrushFTP Instance 2 For EFT"
  }
]

common_tags = {
  "ApplicationName"   = "Hermes2.0"
  "Automated"         = "True"
  "BackupPlan"        = "None"
  "CostCenter"        = "Operations"
  "CreatedBy"         = "DevOps"
  "CreatedOn"         = "09182024"
  "DataClassification"= "Low"
  "Department"        = "HMS2"
  "Infrastructure"    = "False"
  "LastUpdated"       = "09182024"
  "Name"              = "EC2-RHEL-RML-QA"
  "TechStack"         = "AWS"
  "Usage"             = "Project"
  "Version"           = "1.0"
}
