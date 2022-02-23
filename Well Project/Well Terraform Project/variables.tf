
variable "profile" {
  default = "terraform"
}

# region name
variable "region_name" {
    type = string
    description = "region name"
    default = "us-east-1"
}
# KMS Variable
variable "s3_kms_key_deletion_period" {
    type = number
    description = "KMS key deletion period"
    default = "30"
} 

# S3 variables
variable "s3_bucket_name"{
    type = string
    description = "bucket name"
}

variable "s3_acl_perm"{
    type = string
    description = "Bucket ACL permission"
    default = "private"
}

variable "s3_versioning" {
    type = string
    description = "Enabled or Suspended"
}

variable "s3_tags" {
    type = map
    description = "tags"
}


