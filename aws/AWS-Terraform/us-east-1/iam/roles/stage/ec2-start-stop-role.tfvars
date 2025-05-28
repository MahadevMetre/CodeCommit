policy_name			= "ec2-start-stop-policy-stage"
role_name			= "ec2-start-stop-role-stage"
role_tags			= {
        "Department": "DOS"
        "LastUpdated": "06262023"
        "CostCenter":  "FMG"
        "CreatedOn": "02132023"
        "DataClassification": "Low"
        "Infrastructure": "False"
        "Usage":"Project"
        "Version": "1.0"
        "ApplicationName": "DevOps"
        "TechStack": "AWS"
        "Automated": "True"
        "BackupPlan": "None"
        "CreatedBy": "sbose"
    }
lambda_vpc_connect					= true
ec2-start-stop-policy				= true
eventbridge_scheduler_source_arn	= "arn:aws:scheduler:us-east-1:702230634984:schedule/ec2_instance_management/*"