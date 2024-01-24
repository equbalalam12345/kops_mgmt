#!/bin/bash
sudo apt update -y
# sudo export name=latheeffoods.shop  >> /home/ubuntu/.bashrc
# sudo export KOPS_STATE_STORE=s3://latheeffoods.shop  >> /home/ubuntu/.bashrc
# sudo export AWS_REGION=us-east-2   >> /home/ubuntu/.bashrc
# sudo export CLUSTER_NAME=latheeffoods.shop  >> /home/ubuntu/.bashrc
# sudo alias ku=kubectl  >> /home/ubuntu/.bashrc

sudo wget https://github.com/kubernetes/kops/releases/download/v1.28.2/kops-linux-amd64 /tmp/lokesh
# sudo mv kops-linux-amd64 kops
# sudo chmod 700 kops
# sudo mv kops /usr/local/bin/
# sudo  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
# sudo chmod 700 kubectl
# sudo mv kubectl /usr/local/bin/
