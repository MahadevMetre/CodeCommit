# Step 1: Create the IAM Role with Trust Policy
resource "aws_iam_role" "ssm_quick_setup_role" {
  name = "AmazonSSMRoleForInstancesQuickSetup"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Step 2: Attach AWS Managed Policies
resource "aws_iam_role_policy_attachment" "ssm_managed_instance_core" {
  role       = aws_iam_role.ssm_quick_setup_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_role_policy_attachment" "ssm_patch_association" {
  role       = aws_iam_role.ssm_quick_setup_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMPatchAssociation"
}

# Step 3: Attach Custom Policies

# Custom Policy 1: aws-quicksetup-patchpolicy-baselineoverrides-s3
resource "aws_iam_policy" "patch_policy" {
  name        = "aws-quicksetup-patchpolicy-baselineoverrides-s3"
  description = "Custom patch policy for accessing S3"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid      = "AccessToAllPatchPolicyRelatedBuckets",
        Effect   = "Allow",
        Action   = "s3:GetObject",
        Resource = "arn:aws:s3:::aws-quicksetup-patchpolicy-*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_patch_policy" {
  role       = aws_iam_role.ssm_quick_setup_role.name
  policy_arn = aws_iam_policy.patch_policy.arn
}

# Custom Policy 2: FMG-SSM-SentinelOne-Policy
resource "aws_iam_policy" "sentinel_one_policy" {
  name        = "FMG-SSM-SentinelOne-Policy"
  description = "Allow DescribeTags"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid    = "VisualEditor0",
        Effect = "Allow",
        Action = "ec2:DescribeTags",
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_sentinel_one_policy" {
  role       = aws_iam_role.ssm_quick_setup_role.name
  policy_arn = aws_iam_policy.sentinel_one_policy.arn
}

# Custom Policy 3: lasso-secrets-manager-policy-stage
resource "aws_iam_policy" "lasso_secrets_manager_policy" {
  name        = "lasso-secrets-manager-policy-stage"
  description = "Allow access to Secrets Manager"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid      = "VisualEditor0",
        Effect   = "Allow",
        Action   = [
          "kms:DescribeKey",
          "kms:ListAliases",
          "kms:ListKeys",
          "lambda:ListFunctions",
          "rds:DescribeDBClusters",
          "rds:DescribeDBInstances",
          "secretsmanager:GetRandomPassword",
          "secretsmanager:ListSecrets",
          "tag:GetResources"
        ],
        Resource = "*"
      },
      {
        Sid      = "VisualEditor1",
        Effect   = "Allow",
        Action   = [
          "secretsmanager:DescribeSecret",
          "secretsmanager:GetResourcePolicy",
          "secretsmanager:GetSecretValue",
          "secretsmanager:ListSecretVersionIds"
        ],
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_lasso_secrets_policy" {
  role       = aws_iam_role.ssm_quick_setup_role.name
  policy_arn = aws_iam_policy.lasso_secrets_manager_policy.arn
}

# Step 4: Output (Optional)
output "ssm_quick_setup_role_arn" {
  value = aws_iam_role.ssm_quick_setup_role.arn
}

# Define variables
variable "patch_policy_name" {
  type        = string
  description = "The name of the custom patch policy"
}

variable "sentinel_policy_name" {
  type        = string
  description = "The name of the custom SentinelOne policy"
}

variable "secrets_manager_policy_name" {
  type        = string
  description = "The name of the Secrets Manager policy"
}