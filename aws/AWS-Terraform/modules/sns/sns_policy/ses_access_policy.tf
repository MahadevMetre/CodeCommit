resource "aws_sns_topic_policy" "ses_access_policy_sns" {
  count     = var.ses_access_policy ? 1 : 0
  arn       = var.sns_arn_val

  policy    =<<POLICY
	{
	  "Version": "2008-10-17",
	  "Id": "__default_policy_ID",
	  "Statement": [
		{
		  "Sid": "__default_statement_ID",
		  "Effect": "Allow",
		  "Principal": {
			"Service": "ses.amazonaws.com"
		  },
		  "Action": "SNS:Publish",
		  "Resource": "${var.sns_arn_val}",
		  "Condition": {
			"StringEquals": {
			  "aws:SourceOwner": "${var.source_owner}"
			}
		  }
		}
	  ]
	}
	POLICY
}