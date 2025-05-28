ebs_size = 30
volume_type = "gp2"
ebs_tags = {
        "ApplicationName": "DevOps",
        "Automated": "True",
        "BackupPlan": "None",
        "CostCenter": "FMG",
        "CreatedBy": "DevOps",
        "CreatedOn": "05112021",
        "DataClassification": "Low",
        "Department": "DOS",
        "Infrastructure": "False",
        "LastUpdated": "06262023",
        "TechStack": "AWS",
        "Usage": "Project",
        "Version": "1.0"
}
ebs_encrypted = true
kms_key_id = "arn:aws:kms:us-east-1:116762271881:key/f991debb-2f56-4590-bd49-8245fad06084"
ami = "ami-096fda3c22c1c990a"
instance_type = "c4.large"
ec2_region = "us-east-1a"
public_ip_bool = false
key_name = "EC2-Dev-key"
security_groups = ["sg-0a02311a28b939f42",
    "sg-0dec3c563b782653b"]
subnet_id = "subnet-06291ceaa523f684c"
tags = {
        "ApplicationName": "DevOps",
        "Automated": "True",
        "BackupPlan": "None",
        "CostCenter": "FMG",
        "CreatedBy": "DevOps",
        "CreatedOn": "05112021",
        "DataClassification": "Low",
        "Department": "DOS",
        "Infrastructure": "False",
        "LastUpdated": "06262023",
        "TechStack": "AWS",
        "Usage": "Project",
        "Version": "1.0"
}
instance_initiated_shutdown_behavior = "stop"
