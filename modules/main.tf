provider "aws"{
  region = var.region_name
}

resource "aws_s3_bucket" "well_bucket" {
  bucket = var.s3_bucket
  tags   = {
    Name = "${var.bucket_name}"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.example.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.example.id
  versioning_configuration {
    status = "Enabled"
  }
}