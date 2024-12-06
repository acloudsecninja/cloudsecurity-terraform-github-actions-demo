## BAD Resource ##
resource "aws_vpc" "acloudsecninja-cloudsec-vpc-test2" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "acloudsecninja-cloudsec-vpc-test2"
  }
}


## GOOD Resource ##
resource "aws_s3_bucket" "example123412312" {
  bucket = "example123412312"

  tags = {
    Name        = "example123412312"
    Environment = "nprd"
  }
}
## This is example of fixing a trivy finding and can be shown as an example to students
#resource "aws_s3_bucket_public_access_block" "example123412312" {
#  bucket = aws_s3_bucket.example123412312.id
#
#  block_public_acls       = true
#  block_public_policy     = true
#  ignore_public_acls      = true
#  restrict_public_buckets = true
#}