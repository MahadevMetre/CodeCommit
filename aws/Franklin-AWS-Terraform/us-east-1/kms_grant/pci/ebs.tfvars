name              = "ASG-role_KMS-grant"
key_id            = "arn:aws:kms:us-east-1:601751840347:key/424d8df7-29d0-42fc-b424-1785a210c6c3"
iam_arn           = "arn:aws:iam::601751840347:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
operations        = [ 
    "Encrypt", 
    "Decrypt",
    "GenerateDataKey"
]