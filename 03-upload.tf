# Upload files to S3 (dynamically handles all files in var.files_to_upload)
resource "aws_s3_object" "uploaded_files" {
  for_each = var.files_to_upload

  bucket       = aws_s3_bucket.potterrbucket-8988.id
  key          = each.key              # S3 object path (e.g., "backups/example.jpg")
  source       = each.value            # Local file path (e.g., "./local-files/example.jpg")
  etag         = filemd5(each.value)   # Auto-update if local file changes
  content_type = lookup({
    ".jpg"  = "image/jpeg",
    ".png"  = "image/png",
    ".pdf"  = "application/pdf",
    ".txt"  = "text/plain",
    ".zip"  = "application/zip"
  }, ".${split(".", each.key)[1]}", "application/octet-stream") # Auto-detect content type
}