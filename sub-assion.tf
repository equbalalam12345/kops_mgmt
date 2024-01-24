
resource "aws_route_table_association" "kops_vpc_rt_internet" {
  subnet_id      = aws_subnet.kops_vpc_Pub-subnet.id
  route_table_id = aws_route_table.pub_routing_table.id
                   
     }