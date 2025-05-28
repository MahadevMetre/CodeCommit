resource "aws_iam_role_policy" "digital-serverless-parameter" {
  count = var.digital-serverless-parameter ? 1 : 0
  name  = var.policy_name
  role  = var.iam_role_id
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
            "Effect": "Allow",
            "Action": [
                "ssm:DescribeParameters"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "ssm:GetParameters",
                "ssm:GetParameter"
            ],
            "Resource": var.secrets_name
        },
        {
            "Effect": "Allow",
            "Action": [
                "kms:Decrypt"
            ],
            "Resource": var.kms_key
        }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach-ecs-execution-default-policy" {
    count = var.digital-serverless-parameter ? 1 : 0
    role       = var.iam_role_id
    policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_iam_role_policy_attachment" "attach-batch-access" {
    count = var.digital-serverless-parameter ? 1 : 0
    role       = var.iam_role_id
    policy_arn = "arn:aws:iam::aws:policy/AWSBatchFullAccess"
}

resource "aws_iam_role_policy_attachment" "attach-ecs-execution" {
    count = var.digital-serverless-parameter ? 1 : 0
    role       = var.iam_role_id
    policy_arn = "arn:aws:iam::aws:policy/SecretsManagerReadWrite"
}