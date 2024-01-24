# kopsrepo

steps to create cluster and loadbalancer deployment 
----------------------------------------------------
1.DNS name

2.AWS acoount

3.route53

4.we need vpc ubuntu server 20.04

5.genarate ssh-keys

    as root , we need to craete sh keys 
    ssh-keygen
    after genarate  kops will use this public key and copy to nodes.

5. Download kops nad kubectl  form github.com/kubarnetes/kops
   search v1.26.3 copy the kops-linux-amd64 and copy the link and 
   go to cd /usr/local/bin
     wget https://github.com/kubernetes/kops/release/download/v1.26.3/kops-linux-amd64
    copy envs which is lister bellow and go .bashrc
    and comedown shitf+g  past here 

6.aws s3 bucket to save cluter state.

7.dounload kops and kubectl command

8. create IAM role and assign to the server.

9.Edit .bashrc and add all the env variables. 

sudo su - from normal user
  export name=kops-cluster-hvpc.shop
export KOPS_STATE_STORE=s3://kops-cluster-hvpc.shop
export AWS_REGION=us-east-2
export CLUSTER_NAME=kops-cluster-hvpc.shop
save and exit
and type source .bashrc or exit and login
then type env

dry run
=======
     
     
   

sudo wget https://github.com/kubernetes/kops/releases/download/v1.28.2/kops-linux-amd64 /tmp/lokesh



10.

kops create cluster --name=hvpc.shop \
      --state=s3://hvpc.shop --zones=us-east-1a,us-east-1b,us-east-1c \
       --node-count=3 --master-count=3 --node-size=t3.medium --master-size=t3.medium \
       --master-zones=us-east-1a,us-east-1b,us-east-1c --master-volume-size=10 --node-volume-size=10 \
       --ssh-public-key ~/.ssh/id_rsa.pub \
       --dns-zone=hvpc.shop


11.
kops update cluster --name hvpc.shop --yes --admin


Suggestions:
 * validate cluster: kops validate cluster --wait 10m
 * list nodes: kubectl get nodes --show-labels
 * ssh to a control-plane node: ssh -i ~/.ssh/id_rsa ubuntu@api.hvpc.shop
 * the ubuntu user is specific to Ubuntu. If not using Ubuntu please use the appropriate user based on your OS.
 * read about installing addons at: https://kops.sigs.k8s.io/addons.


Check the ec2 clusters got created or not if yes , take any cluster and connect with it then 
You will see ssh clint and copy the same and paste on cluster 

Example :

ssh -i "kubernetes.hvpc.shop-d0:80:d4:8d:53:cf:e7:86:1d:6d:c2:94:82:9c:a5:45.pem" ubuntu@ec2-35-171-3-147.compute-1.amazonaws.com


git clone https://github.com/smobinulla/prac.git

Ls 

Cd /prac


====================================================================

after our modification we can copy and in masterserver as kops-cluster.yml
then type execute kops cluter help

11.#kops create -f kops-cluster.yml  
12   #kops update cluter --name hvpc.shop. --yes --admin
13   # kops validate cluster --wait 10m
14.  # kops delete -f kops-cluster.yml --yes  >>>> we can delete the cluster..
15. kops delete cluster --name=hvpc.shop --state=s3://hvpc.shop --yes



aftrer this 
We need to do smoke test

1. check Cluster-info
     #ku cluster info
2. check master and nodes
     #ku get nodes
3. check namespaces
4. check mgmt pods kube-system namespace.
5. Deploy test POD and check the status .
6. Expose pod in nodeport.
7. Deploy sample deployment.
8. Expose deployment with NodePort.
9. Check service which are exposing POD and and Deployment to Internet.
10. deletea pod and check if t

# kubectl version --short
for auto fill commands
=======================
echo 'source <(kubectl completion bash)' >>~/.bashrc

echo 'complete -o default -F __start_kubectl ku' >>~/.bashrc

=====================

# ku get nodes --no-headers 
ku get ns
ku get pods-n kube-system

certification genaration 
=========================================================================
certbot certonly --manual --preferred-challenges=dns --key-type rsa --email lokeshjune26@gmail.com \
--server https://acme-v02.api.letesencript.org/directory --arange-tos -d *.hvpc.shop