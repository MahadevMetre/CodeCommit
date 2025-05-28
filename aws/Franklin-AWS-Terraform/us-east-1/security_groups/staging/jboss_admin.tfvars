name = "jboss_admin_security_group"
description = "Security Group for JBOSS admin servers"
vpc_id = "vpc-0051d323df13c7db3"
tags ={
    "ApplicationName" = "DevOps"
    "Automated" = "True"
    "BackupPlan" = "None"
    "CostCenter" = "FMG"
    "CreatedBy" = "DevOps"
    "CreatedOn" = "05082021"
    "DataClassification" = "Low"
    "Department" = "DOS"
    "Infrastructure" = "False"
    "LastUpdated" = "06262023"
    "TechStack" = "JBoss"
    "Usage" = "Project"
    "Version" = "1.0"
}


sg_ingress_rules = {
  "1" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.64.64.0/19",
        "172.21.148.0/24",
        "172.21.150.0/24",
        "203.62.174.238/32"]
    description = "HTTPS"
  },
  "2" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.64.64.0/19",
        "172.21.148.0/24",
        "172.21.150.0/24",
        "203.62.174.238/32",
        "10.153.10.12/32",
        "10.217.98.102/32",
        "10.217.33.72/31"]
    description = "SSH"
  },
  "3" = {
    from_port   = 9990
    to_port     = 9995
    protocol    = "tcp"
    cidr_blocks = ["10.64.64.0/19",
        "172.21.148.0/24",
        "172.21.150.0/24",
        "203.62.174.238/32"]
    description = "Console"
  },
  "4" = {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = ["10.153.18.0/24",
      "10.153.19.0/24"]
    description = "EFS mount target"
  },
  "5" = {
    from_port   = 9990
    to_port     = 9995
    protocol    = "tcp"
    cidr_blocks = ["10.153.18.0/24",
      "10.153.19.0/24"]
    description = "Console access for slave"
  },
  "6" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.153.18.0/24",
        "10.153.19.0/24"]
    description = "HTTPS for slave"
  }
}