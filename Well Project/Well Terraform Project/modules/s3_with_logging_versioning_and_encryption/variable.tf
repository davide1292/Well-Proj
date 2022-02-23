# KMS
variable "kms_key_deletion_period" {
  type = number
  default = 30
  description = "The number of days to retain the KMS key before deleting it"
}

#S3
variable "bucket_name" {
    type = string
    description = "S3 bucket name"
}

variable "tags" {
    type = map
    description = "The tags to apply to the resource"
}

variable "versioning_enabled" {
    type = string
    description = "Enable versioning on the bucket"
}

variable "acl" {
    type = string
    description = "The ACL to apply to the bucket"
}