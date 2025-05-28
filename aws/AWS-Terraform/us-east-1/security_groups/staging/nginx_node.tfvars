name = "nginx_node_security_group"
description = "Security Group for Nginx node servers"
vpc_id = "vpc-0051d323df13c7db3"
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
    "TechStack" = "Nginx"
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
        "10.153.18.0/24",
        "10.153.19.0/24"]
    description = "HTTP"
  },
  "2" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.64.64.0/19",
        "172.21.148.0/24",
        "172.21.150.0/24",
        "10.153.10.12/32",
        "203.62.174.238/32",
        "10.217.98.102/32",
        "10.217.33.72/31"]
    description = "SSH"
  },
  "4" = {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = ["10.153.18.0/24",
      "10.153.19.0/24"]
    description = "EFS mount target"
  }
}