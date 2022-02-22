variable "s3_bucket"{
    type = string
    description = "bucket name"
}
variable "acl_perm"{
    type = string
    description = "ACL"
    default = "private"
}
variable "versioning" {
    type = string
    description = "versioning configuration" 
}