resource "aws_iam_policy" "proteus2_acxiom_olmb_lambda_policy" {
  count         =   var.proteus2_acxiom_olmb_lambda_policy ? 1 : 0
  name			=	var.iam_policy_name
  description	=	var.iam_policy_desc
  tags			=	var.iam_policy_tags
  policy = jsonencode({

    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": "logs:CreateLogGroup",
            "Resource": "arn:aws:logs:us-east-1:702230634984:*"
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": [
                "arn:aws:logs:us-east-1:702230634984:log-group:/aws/lambda/proteus2*:*",
                "arn:aws:logs:us-east-1:702230634984:log-group:/aws/lambda/Proteus2*:*"
            ]
        },
        {
            "Sid": "VisualEditor2",
            "Effect": "Allow",
            "Action": [
                "s3:Get*",
                "s3:List*",
                "s3:Put*",
                "s3:Delete*",
                "s3-object-lambda:Get*",
                "s3-object-lambda:List*"
            ],
            "Resource": [
                "arn:aws:s3:::fmg-dw-s3-landing-qa",
                "arn:aws:s3:::fmg-dw-s3-landing-qa/*",
                "arn:aws:s3:::fmg-dw-s3-archival-qa",
                "arn:aws:s3:::fmg-dw-s3-archival-qa/*",
                "arn:aws:s3:::fmg-dw-s3-datalake-qa",
                "arn:aws:s3:::fmg-dw-s3-datalake-qa/*",
                "arn:aws:s3:::fmg-dw-acxiom-stage",
                "arn:aws:s3:::fmg-dw-acxiom-stage/*"
            ]
        },
        {
            "Sid": "SecretsManagerPermissions",
            "Effect": "Allow",
            "Action": [
                "secretsmanager:GetSecretValue"
            ],
            "Resource": [
                "arn:aws:secretsmanager:*:*:secret:*"
            ]
        },
        {
            "Sid": "VisualEditor3",
            "Action": [
                "ec2:CreateNetworkInterface",
                "ec2:DeleteNetworkInterface",
                "ec2:DescribeNetworkInterfaces"
            ],
            "Effect": "Allow",
            "Resource": "*"
        },
        {
            "Sid": "AmazonRedshiftDataFullAccess",
            "Effect": "Allow",
            "Action": [
                "redshift-data:BatchExecuteStatement",
                "redshift-data:CancelStatement",
                "redshift-data:DescribeStatement",
                "redshift-data:DescribeTable",
                "redshift-data:ExecuteStatement",
                "redshift-data:GetStatementResult",
                "redshift-data:ListDatabases",
                "redshift-data:ListSchemas",
                "redshift-data:ListTables"
            ],
            "Resource": "*"
        }
    ]
  })
}

