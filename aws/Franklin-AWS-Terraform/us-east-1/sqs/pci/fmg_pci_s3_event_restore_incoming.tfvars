sqs_queue_name              = "s3_event_restore_incoming"
environment                 = "pci"
s3_pub_iam_consumer         = true
publisher_list               = [
    "arn:aws:s3:::insurancenontermcabinet-pci",
    "arn:aws:s3:::insurancetermcabinet-pci",
    "arn:aws:s3:::insuranceclaimscabinet-pci",
    "arn:aws:s3:::insurancehistoriccabinet-pci",
    "arn:aws:s3:::customercommunications-prod",
	"arn:aws:s3:::customercommunications-email-prod"	
    ]
    
consumer_list                = [
    "arn:aws:iam::894891841990:user/S3-Event-SQS-User-PCI"
    ]

tags ={
    "ApplicationName" = "Hermes"
    "Automated" = "True"
    "BackupPlan" = "None"
    "CostCenter" = "Operations"
    "CreatedBy" = "DevOps"
    "CreatedOn" = "NoInfo"
    "DataClassification" = "Low"
    "Department" = "HMS"
    "Infrastructure" = "False"
    "LastUpdated" = "06262023"
    "TechStack" = "AWS"
    "Usage" = "Project"
    "Version" = "1.0"
}