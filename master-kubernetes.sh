# Welcome to iBOS Ltd.

#!/bin/sh

# Author : Kausar (iBOS)
# Script follows here:
## Install Docker,kubeadm,kubelet,kubectl

# For Master nodes

## Install Docker,kubeadm,kubelet,kubectl

sudo wget https://raw.githubusercontent.com/lerndevops/labs/master/scripts/installK8S.sh -P /tmp
sudo chmod 755 /tmp/installK8S.sh
sudo bash /tmp/installK8S.sh

## Initialize kubernetes Master Node
 
#sudo kubeadm init --ignore-preflight-errors=all

#sudo kubeadm init --cri-socket=/var/run/crio/crio.sock


#sudo mkdir -p $HOME/.kube

#sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config

#sudo chown $(id -u):$(id -g) $HOME/.kube/config

## install networking driver -- Weave/flannel/canal/calico etc... 

## below installs weave networking driver 

#sudo kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')" 

# Validate:  kubectl get nodes

### INSTALL DOCKER 

sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update ; clear
sudo apt-get install -y docker-ce

sudo wget https://raw.githubusercontent.com/lerndevops/labs/master/kube/install/daemon.json -P /etc/docker
sudo service docker restart
#sudo service docker status

### INSTALL KUBEADM,KUBELET,KUBECTL

sudo echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo apt-get update ; 
sudo apt-get install -y kubelet kubeadm kubectl

### Initialize Master Node 

#sudo kubeadm init --ignore-preflight-errors=all

sudo kubeadm init --cri-socket=/var/run/crio/crio.sock


sudo mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

## install networking driver -- Weave/flannel/canal/calico etc... 

## below installs weave networking driver 

sudo kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')" 

sudo apt-get update

# Validate: kubectl get nodes

sudo kubectl get nodes
