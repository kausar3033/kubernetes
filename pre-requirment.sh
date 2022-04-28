## Welcoem to iBOS DevOps Team.

#!/bin/sh
# Script follows here
## Install Docker,kubeadm,kubelet,kubectl


sudo apt full-upgrade -y

sudo apt-get install openssh-server
sudo systemctl enable ssh
sudo systemctl start ssh
sudo apt-get clean
#cat /etc/fstab
#vi /etc/fstab
   
sudo apt install nginx-full

sudo apt install default-jre

sudo apt-get update

sudo swapoff -a

sudo reboot
