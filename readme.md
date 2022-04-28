## Welcoem to iBOS DevOps Team.

### Installation Guide Kubernetes A to Z

### For Master Nodes & Worker Nodes

### Install Docker,kubeadm,kubelet,kubectl,Openssh,Nginx,jare,Edit etc/fstab >> swap memory mount location

#### First we will work on master node and then we will creat the worker node

#### Download [pre-requirment.sh] and [master-kubernetes.sh] & [readme.md] & [remove.sh] in master machin and dowanload [pre-requirment.sh] and [worker-kubernetes.sh] & [remove.sh] in worker machin then execute step by step.

#### After download the files please change the file permission: [Download in user root directory]

    chmod +x pre-requirment.sh 
  
    chmod +x master-kubernetes.sh 
    
    chmod +x worker-kubernetes.sh
    
    chmod +x remove.sh

### For Master Nodes:

step -1: Change the normal user to root user [always work from root user]

    sudo su -

step -2: Edit /etc/fstab file [ commentout the swap memory mounted line ex:#/swap.img   none  swap   sw    0   0 ]

    vi /etc/fstab

step -3: Execute pre-requirment.sh from root user /root directory [ check the current directory pwd ]

    ./pre-requirment.sh

step -4: Execute kubernetes.sh from root user /root directory [ check the current directory pwd ]

    ./master-kubernetes.sh

step -5: In the shall executing time you asking Do you want to continue? [Y/n] say Y/n

### For Worker Nodes:

step -1: Change the normal user to root user [always work from root user]
           
    sudo su - 

step -2: Edit /etc/fstab file [ commentout the swap memory mounted line ex:#/swap.img   none  swap   sw    0   0 ]

    vi /etc/fstab

step -3: Execute pre-requirment.sh from root user /root directory [ check the current directory pwd ]

    ./pre-requirment.sh

step -4: Execute kubernetes.sh from root user /root directory [ check the current directory pwd ]

    ./worker-kubernetes.sh

step -5: In the shall executing time , asking Do you want to continue? [Y/n] say Y

step -6: Now times to join with master nodes

#### Final step ,afterv complete Master & Worker nodes .


step -1: RUN on Master Node machin to get join token 

    kubeadm token create --print-join-command

#### output : ex: [kubeadm join 10.209.99.225:6443 --token ukzmux.wn3k3ykh5ldo9557 --discovery-token-ca-cert-hash sha256:7221e7dcfc1e7bbfdf9dcb83c6f43e4aa51ce558f07831948ea039b23d181329]  token is inside in []

step -2: Token >> copy the token from master node after get token and execute on which worker nodes want to join to master node. we will see the join status if successfully added

step -3: To check join status if status is ready and worker nodes are showing 

     kubectl get nodes

### If somehow error occoured ,od conflict installation remove all of configurating oneclick 

step -1: Execute  

    ./remove.sh 

step -2: In the shall executing time ,asking Do you want to continue? [Y/n] y 

After remove configuration ,re-install form first level.

### Happy Kubernetes

