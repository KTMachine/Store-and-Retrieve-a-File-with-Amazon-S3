output "bucket_name" {
  description = "Name of the created S3 bucket"
  value       = aws_s3_bucket.potterrbucket-8988.bucket
}

output "bucket_arn" {
  description = "ARN of the bucket"
  value       = aws_s3_bucket.potterrbucket-8988.arn
}

output "uploaded_files" {
  description = "Details of uploaded files"
  value = {
    for file in aws_s3_object.uploaded_files :
    file.key => {
      s3_uri    = "s3://${aws_s3_bucket.potterrbucket-8988.bucket}/${file.key}",
      full_url  = "https://${aws_s3_bucket.potterrbucket-8988.bucket}.s3.${var.region}.amazonaws.com/${file.key}",
      local_md5 = filemd5(var.files_to_upload[file.key])
    }
  }
}

output "console_url" {
  description = "AWS Console URL for the bucket"
  value       = "https://s3.console.aws.amazon.com/s3/buckets/${aws_s3_bucket.potterrbucket-8988.bucket}"
}