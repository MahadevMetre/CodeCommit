resource "aws_iam_role" "ecsTaskExecutionRole" {
	count = var.create_iam_role ? 1: 0
	name = var.iam_role_name
	assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
	tags = var.iam_role_tags
}

data "aws_iam_policy_document" "assume_role_policy" {
	statement {
		actions = ["sts:AssumeRole"]
		principals {
		type = "Service"
			identifiers = ["ecs-tasks.amazonaws.com"]
		}
		condition {
			test = "StringEquals"
			variable = "aws:SourceAccount"
			values = ["${data.aws_caller_identity.current.account_id}"]
		}
	}
	statement {
		actions = ["sts:AssumeRole"]
		principals {
		type = "Service"
			identifiers = ["events.amazonaws.com"]
		}
		condition {
			test = "StringEquals"
			variable = "aws:SourceAccount"
			values = ["${data.aws_caller_identity.current.account_id}"]
		}
	}
	statement {
		actions = ["sts:AssumeRole"]
		principals {
		type = "Service"
			identifiers = ["scheduler.amazonaws.com"]
		}
		condition {
			test = "StringEquals"
			variable = "aws:SourceAccount"
			values = ["${data.aws_caller_identity.current.account_id}"]
		}
	}
}

resource "aws_iam_role_policy_attachment" "AmazonECSTaskExecutionRolePolicy" {
	count = var.create_iam_role ? 1: 0
	role = aws_iam_role.ecsTaskExecutionRole[0].name
	policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_iam_role_policy_attachment" "AWSBatchFullAccess" {
	count = var.create_iam_role ? 1: 0
	role = aws_iam_role.ecsTaskExecutionRole[0].name
	policy_arn = "arn:aws:iam::aws:policy/AWSBatchFullAccess"
}

resource "aws_iam_role_policy_attachment" "SecretsManagerReadWrite" {
	count = var.create_iam_role ? 1: 0
	role = aws_iam_role.ecsTaskExecutionRole[0].name
	policy_arn = "arn:aws:iam::aws:policy/SecretsManagerReadWrite"
}

resource "aws_iam_role_policy_attachment" "AWSLambda_FullAccess" {
	count = var.create_iam_role ? 1: 0
	role = aws_iam_role.ecsTaskExecutionRole[0].name
	policy_arn = "arn:aws:iam::aws:policy/AWSLambda_FullAccess"
}

module "iam_policy" {
	source						= "../../../../modules/iam/policy/"
	iam_policy_name					= var.iam_policy_name
	iam_role_id				    = var.iam_role_id
	athena-serverless-parameter	= var.athena-serverless-parameter
	ssm_parameter_arn 			= var.ssm_parameter_arn
	kms_key						= var.kms_key
}