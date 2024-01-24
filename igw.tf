resource "aws_internet_gateway" "kops_vpc_IGW" {
  vpc_id = aws_vpc.kops_vpc.id

  tags = {
    Name = "aws_vpc.kops_vpc_IGW"
 
  }
}