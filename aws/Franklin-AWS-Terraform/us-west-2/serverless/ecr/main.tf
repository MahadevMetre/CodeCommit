resource "aws_ecr_repository" "my_ecr_repo" {
	name = var.repo_name
	image_scanning_configuration {
		scan_on_push = true
	}
	encryption_configuration {
		encryption_type = "KMS"
	}
	tags = var.repo_tags
}