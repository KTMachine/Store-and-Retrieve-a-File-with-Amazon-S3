resource "aws_s3_bucket" "potterrbucket-8988" {
  bucket = var.bucket_name

  tags = var.tags
}

# resource "aws_s3_bucket_versioning" "potterrbucket-8988_versioning" {
#   count = var.enable_versioning ? 1 : 0
#   bucket = aws_s3_bucket.potterrbucket-8988.id
#   versioning_configuration {
#     status = "Enabled"
#   }
# }

resource "aws_s3_bucket_server_side_encryption_configuration" "potter_bucker_encryption" {
  bucket = aws_s3_bucket.potterrbucket-8988.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "potterrbucket-8988_public_access_block" {
  bucket = aws_s3_bucket.potterrbucket-8988.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}