# KMS Encryption
resource "aws_kms_key" "encryption_key" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = var.kms_key_deletion_period
  tags = var.tags
}

resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  depends_on = [
    aws_s3_bucket.bucket
  ]
  bucket = aws_s3_bucket.bucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.encryption_key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

# Resource Bucket
resource "aws_s3_bucket_acl" "bucket_acl" {
  depends_on = [
    aws_s3_bucket.bucket,
  ]
  bucket = aws_s3_bucket.bucket.id
  acl    = var.acl
}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  depends_on = [
    aws_s3_bucket.bucket
  ]
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = var.versioning_enabled
  }
}

resource "aws_s3_bucket_logging" "bucket_logging" {
  depends_on = [
    aws_s3_bucket.bucket
  ]
  bucket = aws_s3_bucket.bucket.id

  target_bucket = aws_s3_bucket.log_bucket.id
  target_prefix = "log/"
}

resource "aws_s3_bucket" "bucket" {
    bucket = "${var.bucket_name}"
    tags = var.tags
}

# Log Bucket
resource "aws_s3_bucket_acl" "log_bucket_acl" {
  depends_on = [
    aws_s3_bucket.log_bucket
  ]
  bucket = aws_s3_bucket.log_bucket.id
  acl    = "log-delivery-write"
}

resource "aws_s3_bucket" "log_bucket" {
    bucket = "${var.bucket_name}-logs"
    tags = var.tags
}

