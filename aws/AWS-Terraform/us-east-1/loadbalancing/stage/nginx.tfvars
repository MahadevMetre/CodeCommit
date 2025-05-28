name = "UI-lb-stage"
load_balancer_type = "application"
tags = {
        "ApplicationName": "DevOps",
        "Automated": "True",
        "BackupPlan": "None",
        "CostCenter": "FMG",
        "CreatedBy": "DevOps",
        "CreatedOn": "NoInfo",
        "DataClassification": "Low",
        "Department": "DOS",
        "Infrastructure": "False",
        "LastUpdated": "06262023",
        "TechStack": "Nginx",
        "Usage": "Project",
        "Version": "1.0"
}
subnets = ["subnet-076a071fa0723c80e",
    "subnet-0ed61b6beb807094e"]
security_groups = ["sg-09f3879b238abb26e"] 
enable_deletion_protection  = false