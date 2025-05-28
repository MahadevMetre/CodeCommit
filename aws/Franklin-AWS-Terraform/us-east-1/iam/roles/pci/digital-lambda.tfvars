policy_name				= "digital-lambda-inline-policy"
role_name				= "digital-lambda-role-pci"
role_tags				= {
        "Department": "DGT"
        "LastUpdated": "06262023"
        "CostCenter":  "FMG"
        "CreatedOn": "NoInfo"
        "DataClassification": "Low"
        "Infrastructure": "False"
        "Usage":"Project"
        "Version": "1.0"
        "ApplicationName": "Digital"
        "TechStack": "AWS"
        "Automated": "True"
        "BackupPlan": "None"
        "CreatedBy": "sbose"
    }
parameter_arn	= [
				"arn:aws:ssm:us-east-1:601751840347:parameter/selfservice-parameters-pci",
				"arn:aws:sns:us-east-1:601751840347:*",
				"arn:aws:ses:us-east-1:601751840347:identity/*",
			]
sqs_arn_val				= "arn:aws:sqs:us-east-1:601751840347:selfservice-confirm-user-incoming_pci"
lambda-inline-policy	= true
lambda_vpc_connect		= true