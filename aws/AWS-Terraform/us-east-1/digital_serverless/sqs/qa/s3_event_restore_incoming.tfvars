sqs_queue_name              = "s3_event_restore_incoming"
environment                 = "qa"
s3_pub_iam_consumer         = true
publisher_list               = [
    "arn:aws:s3:::insurancenontermcabinet-qa",
    "arn:aws:s3:::insurancetermcabinet-qa",
    "arn:aws:s3:::insuranceclaimscabinet-qa",
    "arn:aws:s3:::insurancehistoriccabinet-qa",
    "arn:aws:s3:::customercommunications-qa",
	"arn:aws:s3:::customercommunications-email-qa"	
    ]
    
consumer_list                = [
    "arn:aws:iam::894891841990:user/S3-Event-SQS-User-PCI"
    ]

tags ={
    "ApplicationName" = "Digital"
    "Automated" = "True"
    "BackupPlan" = "None"
    "CostCenter" = "Operations"
    "CreatedBy" = "DevOps"
    "CreatedOn" = "09142024"
    "DataClassification" = "Low"
    "Department" = "DGT"
    "Infrastructure" = "False"
    "LastUpdated" = "09142024"
    "TechStack" = "AWS"
    "Usage" = "Project"
    "Version" = "1.0"
}