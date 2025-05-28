output "s3_bucket_id"{
  value = aws_s3_bucket.s3_bucket.id
}

output "s3_bucket_arn"{
  value = aws_s3_bucket.s3_bucket.arn
}

output "s3_bucket_output"{
  value = aws_s3_bucket.s3_bucket
}

output "s3_object_id" {
  value = aws_s3_object.s3_object.id
}

output "s3_object_key" {
  value = aws_s3_object.s3_object.key
}

output "s3_object_etag" {
  value = aws_s3_object.s3_object.etag
}

output "s3_object_version_id" {
  value = aws_s3_object.s3_object.version_id
}
