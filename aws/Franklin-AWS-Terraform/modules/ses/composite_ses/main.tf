resource "aws_ses_domain_identity" "my_identity" {
	domain		=	var.ses_domain_name
}

resource "aws_ses_domain_dkim" "my_identity_dkim" {
	domain		=	aws_ses_domain_identity.my_identity.domain
}

resource "aws_ses_identity_policy" "my_policy" {
	identity	=	aws_ses_domain_identity.my_identity.arn
	name		=	var.ses_sending_policy_name
	policy		=	data.aws_iam_policy_document.ses_sending_policy[0].json
}

data "aws_iam_policy_document" "ses_sending_policy" {
  count = var.attach_ses_policy ? 1 : 0
  statement {
    sid = "SendEmailSesApiPolicy"
    actions = ["ses:SendEmail", "ses:SendRawEmail"]
    resources = [aws_ses_domain_identity.my_identity.arn]
    principals {
      identifiers = ["${var.iam_user_arn}"]
      type = "AWS"
    }
    condition {
      test = "StringLike"
      variable = "ses:FromAddress"
      values = ["*@fmservice.com"]
    }
  }
}