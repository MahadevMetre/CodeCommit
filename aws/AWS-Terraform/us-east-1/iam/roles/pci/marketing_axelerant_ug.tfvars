policy_name        = "marketing-user-group-axelerant-inline-policy"
role_name          = "marketing-user-group-axelerant-role-pci"
role_tags          = {
        "Department": "MKT"
        "LastUpdated": "06262023"
        "CostCenter":  "FMG"
        "CreatedOn": "NoInfo"
        "DataClassification": "Low"
        "Infrastructure": "False"
        "Usage":"Project"
        "Version": "1.0"
        "ApplicationName": "Marketing"
        "TechStack": "AWS"
        "Automated": "True"
        "BackupPlan": "None"
        "CreatedBy": "DevOps"
    }
parameter_arn      = ["arn:aws:execute-api:us-east-1:*:38mi4hp88f/*/*/*"] # to Update after api gateway is created
user_group_policy = true