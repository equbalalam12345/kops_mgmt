resource "aws_vpc" "kops_vpc" {
  cidr_block       = "10.232.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "kops_vpc"
  }
}
