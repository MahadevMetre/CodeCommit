name = "UI-lb-dev"
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
subnets = ["subnet-0734d8f28467d319f",
    "subnet-06291ceaa523f684c"]
security_groups = ["sg-0a02311a28b939f42"] 
enable_deletion_protection  = false