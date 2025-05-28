name = "Fastrax_Interim_security_group"
description = "Security Group for Servers added for fastrax"
vpc_id = "vpc-01befeb7d6fed04cd"
tags ={
    "ApplicationName" = "DevOps"
    "Automated" = "True"
    "BackupPlan" = "None"
    "CostCenter" = "FMG"
    "CreatedBy" = "DevOps"
    "CreatedOn" = "05102021"
    "DataClassification" = "Low"
    "Department" = "DOS"
    "Infrastructure" = "False"
    "LastUpdated" = "06262023"
    "TechStack" = "AWS"
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
        "203.62.174.238/32",
        "10.153.19.210/32"]
    description = "HTTP"
  },
  "2" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.64.64.0/19",
        "10.153.14.201/32",
        "10.153.14.33/32",
        "10.153.19.210/32"]
    description = "SSH"
  }
}