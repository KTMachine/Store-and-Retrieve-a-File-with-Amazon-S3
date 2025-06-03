variable "region" {
  description = "AWS region where the S3 bucket will be created"
  type = string
  default = "us-east-1"
}

variable "bucket_name" {
  description = "Name of the S3 bucket (must be globally unique)"
  type = string
}

variable "enable_versioning" {
  description = "Enable versioning for the bucket (true/false)"
  type = bool
  default = false
}

variable "files_to_upload" {
  description = "Map of files to upload to S3 (key = path in bucket, value = loacl path)"
  type = map(string)
  default = {
    "backups/example.png" = "./local-files/example.png"
  }
}

variable "tags" {
  description = "Tags to apply to all resources"
  type = map(string)
  default = {
    Project = "S3Backup",
    ManagedBy = "Terraform"
  }
}