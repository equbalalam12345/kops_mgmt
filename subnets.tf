resource "aws_subnet" "kops_vpc_Pub-subnet" {
  vpc_id                  = aws_vpc.kops_vpc.id
  cidr_block              = "10.232.2.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = "true"
  depends_on = [aws_vpc.kops_vpc]
  tags = {
    Name = "kops_vpc_public-subnet"
  }
}
