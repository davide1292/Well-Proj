module "s3_bucket" {
    source = "./modules/s3_with_logging_versioning_and_encryption"
    bucket_name = var.s3_bucket_name
    acl = var.s3_acl_perm
    versioning_enabled = var.s3_versioning
    tags = var.s3_tags
    kms_key_deletion_period = var.s3_kms_key_deletion_period
}
