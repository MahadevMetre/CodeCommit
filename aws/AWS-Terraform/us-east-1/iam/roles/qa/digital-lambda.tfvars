policy_name				= "digital-lambda-inline-policy"
role_name				= "digital-lambda-role-qa"
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
        "CreatedBy": "DevOps"
    }
parameter_arn	= [
				"arn:aws:ssm:us-east-1:634621569833:parameter/selfservice-parameters-qa",
				"arn:aws:sns:us-east-1:634621569833:*",
				"arn:aws:ses:us-east-1:634621569833:identity/*",
			]
sqs_arn_val				= "arn:aws:sqs:us-east-1:634621569833:selfservice-confirm-user-incoming_qa"
lambda-inline-policy	= true
lambda_vpc_connect		= true