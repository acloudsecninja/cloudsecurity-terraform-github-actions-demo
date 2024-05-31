resource "aws_vpc" "acloudsecninja-cloudsec-vpc-test2" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "acloudsecninja-cloudsec-vpc-test2"
  }
}
