#Create a security group-public

resource "aws_security_group" "kops_vpc_sg" {
name = "KOPS-VPC-SG"
description = "Allow Web inbound traffic"
vpc_id = aws_vpc.kops_vpc.id

ingress {
protocol = "tcp"
from_port = 80
to_port = 80
cidr_blocks = ["0.0.0.0/0"]

}

ingress {
protocol = "tcp"
from_port = 22
to_port = 22
cidr_blocks = ["0.0.0.0/0"]
}

ingress {
protocol = "tcp"
from_port = 443
to_port = 443
cidr_blocks = ["0.0.0.0/0"]
}

ingress {
  #protocol = "allports"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks =  ["0.0.0.0/0"]
  }

egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

ingress {
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Adjust this to limit the source IP ranges if needed
  }
ingress {
    from_port   = 10250
    to_port     = 10250
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Adjust this to limit the source IP ranges if needed
  }
ingress {
    from_port   = 10251
    to_port     = 10251
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Adjust this to limit the source IP ranges if needed
  }

  ingress {
    from_port   = 10252
    to_port     = 10252
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Adjust this to limit the source IP ranges if needed
  }
}

## For worker nodes
# resource "aws_security_group" "worker-nodes-sg" {
# name = "SWARM-vpc-worker-nodes-sg"
# description = "Allow Web inbound traffic"
# vpc_id = aws_vpc.SWARM-VPC.id

#   ingress {
#   from_port   = 10250
#   to_port     = 10250
#   protocol    = "tcp"
#   cidr_blocks = ["0.0.0.0/0"] # Allow traffic from any IP 
#   }
# ingress {
#   from_port   = 30000
#   to_port     = 32767
#   protocol    = "tcp"
#   cidr_blocks = ["0.0.0.0/0"] # Allow traffic from any IP (not recommended for production)
# }

# ingress {
# protocol = "tcp"
# from_port = 80
# to_port = 80
# cidr_blocks = ["0.0.0.0/0"]

# }

# ingress {
# protocol = "tcp"
# from_port = 22
# to_port = 22
# cidr_blocks = ["0.0.0.0/0"]
# }

# ingress {
# protocol = "tcp"
# from_port = 443
# to_port = 443
# cidr_blocks = ["0.0.0.0/0"]
# }

# ingress {
#   #protocol = "allports"
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks =  ["0.0.0.0/0"]
#   }

# egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }



# }
