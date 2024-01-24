resource "aws_instance" "kops_mgmt" {
  ami                          = var.ami_id
  instance_type                = var.instance_type
  subnet_id                    = aws_subnet.kops_vpc_Pub-subnet.id
  vpc_security_group_ids       = [aws_security_group.kops_vpc_sg.id]
  associate_public_ip_address  = true
  availability_zone            = var.az_zone
  key_name                     = "k8snov23"
  iam_instance_profile         = "ELBK8S"
  user_data = <<-EOL
#!/bin/bash -xe
apt update -y
wget https://github.com/kubernetes/kops/releases/download/v1.28.2/kops-linux-amd64 -O  /usr/local/bin/kops
chmod 700 /usr/local/bin/kops
curl -k -o /tmp/kubectl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
exec > >(tee /var/log/user_data.log|logger -t user_data -s 2>/dev/console) 2>&1
chmod 700 /tmp/kubectl
mv /tmp/kubectl /usr/local/bin/
ssh-keygen -t rsa -b 2048 -f /root/.ssh/id_rsa -N ""
echo 'export name=hvpc.shop' >> ~/.bashrc
echo 'export KOPS_STATE_STORE=s3://hvpc.shop' >> ~/.bashrc
echo 'export AWS_REGION=us-east-1' >> ~/.bashrc
echo 'export CLUSTER_NAME=hvpc.shop' >> ~/.bashrc
echo 'alias ku=kubectl' >> ~/.bashrc
export PATH=$PATH:/usr/local/bin
source .bashrc
EOL


  tags = {
    Name = "kops_mgmt"
  }
}
#provider "null" {}

# resource "null_resource" "script_1" {
#   provisioner "local-exec" {
#     command = "./ssh-keys.sh"
#   }
#   depends_on = [aws_instance.kops_mgmt]

# }

# resource "null_resource" "script_2" {
#   provisioner "local-exec" {
#     command = "kops-cluster.sh"
#   }
#    depends_on = [aws_instance.kops_mgmt]
# }



# resource "null_resource" "create_kops_cluster" {
#   provisioner "local-exec" {
#     command = <<-EOT
#       /usr/local/bin/kops create cluster --name=kops-cluster-latheeffoods.shop \
#       --state=s3://latheeffoods.shop --zones=us-east-2a,us-east-2b,us-east-2c \
#       --node-count=3 --master-count=3 --node-size=t3.medium --master-size=t3.medium \
#       --master-zones=us-east-2a,us-east-2b,us-east-2c --master-volume-size=10 --node-volume-size=10 \
#       --ssh-public-key ~/.ssh/id_rsa.pub \
#       --dns-zone=latheeffoods.shop
#     EOT
#   }
  
#   # Trigger execution whenever the AWS instance is created or updated
#   depends_on = [aws_instance.kops_mgmt]
# }


#   provisioner "file" {
#     source      = "/mnt/e/learning/kops/kops-linux-amd64"
#     destination = "/tmp/kops"
#   }

     
#     connection {
#       type        = "ssh"
#       user        = "ubuntu"
#       private_key = file("latheef-ohio.pem")
#       host        = self.public_ip
#     }
  

output "kops_mgmt" {
  value = "${aws_instance.kops_mgmt.*.public_ip}"
}
