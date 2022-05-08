# Welcome to iBOS Ltd.

#!/bin/sh

# Author : Kausar (iBOS)
# Script follows here:
## Remove Docker,kubeadm,kubelet,kubectl


sudo systemctl stop kubelet

sudo systemctl stop docker.socket

sudo systemctl stop docker

sudo apt remove --purge docker-ce docker-ce-cli containerd.io

sudo apt remove --purge docker*

sudo apt-get purge kubeadm kubectl kubelet kubernetes-cni kube*

sudo apt-get autoremove

sudo rm -rf ~/.kube

sudo kubeadm reset

sudo apt autoremove -y

sudo apt autoclean


#Do you want to continue? [Y/n] y
