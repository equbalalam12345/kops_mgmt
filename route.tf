resource "aws_route_table" "pub_routing_table" {
  vpc_id = aws_vpc.kops_vpc.id

  route {
     cidr_block = "0.0.0.0/0"
    #cidr_block =  var.route
    gateway_id = aws_internet_gateway.kops_vpc_IGW.id
    
  }

  tags = {
    Name = "kops_vpc_Public_table"
  }
}



