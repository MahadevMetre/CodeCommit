name = "pci_insuranceapps_server_sg"
description = "Security Group for Servers added for insuranceapps in PCI domain"
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
  "2" = {
    from_port   = 8200
    to_port     = 8200
    protocol    = "tcp"
    cidr_blocks = ["10.153.30.0/24",
      "10.153.31.0/24"
    ]
    description = "Logger Security for APM forwarder"
  },
  "1" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.153.30.115/32"]
    description = "SSH for admin server"
  },
  "3" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.153.30.115/32"]
    description = "HTTPS for admin server"
  }
}