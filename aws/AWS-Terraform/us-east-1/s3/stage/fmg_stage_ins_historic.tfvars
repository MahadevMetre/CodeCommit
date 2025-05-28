bucket_short_name = "insurancehistoriccabinet"
environment = "stage"
create_ins_bucket_policy = true
logging_bucket_name =  "franklin-stage-s3-access-logs"
logging_bucket_base_prefix = "ins"
allowed_ins_users_iam_arn_list = ["arn:aws:iam::894891841990:user/InsCabinet-S3-Api-User-Stage"]

create_sqs_s3_notification            = true
event_notification_arn                = "arn:aws:sqs:us-east-1:702230634984:s3_event_restore_incoming_stage"
events                                = ["s3:ObjectRestore:Completed"]
s3_vpc_endpoint = ["vpce-00697e76c8bf46148"]
versioning   = [
    {
     enabled    = true
     mfa_delete = false
    }
  ]
 
tags ={
        "ApplicationName": "Atlas",
        "Automated": "True",
        "BackupPlan": "None",
        "CostCenter": "Operations",
        "CreatedBy": "DevOps",
        "CreatedOn": "NoInfo",
        "DataClassification": "Low",
        "Department": "ATS",
        "Infrastructure": "False",
        "LastUpdated": "06262023",
        "TechStack": "AWS",
        "Usage": "Project",
        "Version": "1.0"
}


lifecycle_rule = [
    {
      enabled = true
      id = "lifecycle-rule-2018-1d"
      prefix = "HISTORIC/2018/"
      transition = [
        {
          days = 1
          storage_class = "GLACIER"
        },
      ]
      
    },
    {
      enabled = true
      id = "lifecycle-rule-2017-1d"
      prefix = "HISTORIC/2017/"
      transition = [
        {
          days = 1
          storage_class = "GLACIER"
        },
      ]
      
    },{
      enabled = true
      id = "lifecycle-rule-2016-1d"
      prefix = "HISTORIC/2016/"
      transition = [
        {
          days = 1
          storage_class = "GLACIER"
        },
      ]
      
    },{
      enabled = true
      id = "lifecycle-rule-2015-1d"
      prefix = "HISTORIC/2015/"
      transition = [
        {
          days = 1
          storage_class = "GLACIER"
        },
      ]
      
    },{
      enabled = true
      id = "lifecycle-rule-2014-1d"
      prefix = "HISTORIC/2014/"
      transition = [
        {
          days = 1
          storage_class = "GLACIER"
        },
      ]
      
    },{
      enabled = true
      id = "lifecycle-rule-2013-1d"
      prefix = "HISTORIC/2013/"
      transition = [
        {
          days = 1
          storage_class = "GLACIER"
        },
      ]
      
    },{
      enabled = true
      id = "lifecycle-rule-2012-1d"
      prefix = "HISTORIC/2012/"
      transition = [
        {
          days = 1
          storage_class = "GLACIER"
        },
      ]
      
    },{
      enabled = true
      id = "lifecycle-rule-2011-1d"
      prefix = "HISTORIC/2011/"
      transition = [
        {
          days = 1
          storage_class = "GLACIER"
        },
      ]
      
    },{
      enabled = true
      id = "lifecycle-rule-2010-1d"
      prefix = "HISTORIC/2010/"
      transition = [
        {
          days = 1
          storage_class = "GLACIER"
        },
      ]
      
    },{
      enabled = true
      id = "lifecycle-rule-2009-1d"
      prefix = "HISTORIC/2009/"
      transition = [
        {
          days = 1
          storage_class = "GLACIER"
        },
      ]
      
    },{
      enabled = true
      id = "lifecycle-rule-2008-1d"
      prefix = "HISTORIC/2008/"
      transition = [
        {
          days = 1
          storage_class = "GLACIER"
        },
      ]
      
    },{
      enabled = true
      id = "lifecycle-rule-2007-1d"
      prefix = "HISTORIC/2007/"
      transition = [
        {
          days = 1
          storage_class = "GLACIER"
        },
      ]
      
    },{
      enabled = true
      id = "lifecycle-rule-2006-1d"
      prefix = "HISTORIC/2006/"
      transition = [
        {
          days = 1
          storage_class = "GLACIER"
        },
      ]
      
    },{
      enabled = true
      id = "lifecycle-rule-2005-1d"
      prefix = "HISTORIC/2005/"
      transition = [
        {
          days = 1
          storage_class = "GLACIER"
        },
      ]
      
    },{
      enabled = true
      id = "lifecycle-rule-2004-1d"
      prefix = "HISTORIC/2004/"
      transition = [
        {
          days = 1
          storage_class = "GLACIER"
        },
      ]
      
    },{
      enabled = true
      id = "lifecycle-rule-2003-1d"
      prefix = "HISTORIC/2003/"
      transition = [
        {
          days = 1
          storage_class = "GLACIER"
        },
      ]
      
    },{
      enabled = true
      id = "lifecycle-rule-2002-1d"
      prefix = "HISTORIC/2002/"
      transition = [
        {
          days = 1
          storage_class = "GLACIER"
        },
      ]
      
    },{
      enabled = true
      id = "lifecycle-rule-2001-1d"
      prefix = "HISTORIC/2001/"
      transition = [
        {
          days = 1
          storage_class = "GLACIER"
        },
      ]
      
    }
  ]