resource "aws_cloudfront_origin_access_identity" "my_cf_oai" {
	comment = var.comment
}