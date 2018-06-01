#!/bin/bash

scriptPATH=$(dirname $(readlink -f $0))
cd ${scriptPATH}

# 1.Run the join command provided by the master, paste your o
# sudo kubeadm join <master_ip>:6443 --token <token> --discovery-token-ca-cert-hash <cert-has>

# If the join token expired, sudo kubeadm token create --print-join-command

# Change your master_ip and port here
master_ip="127.0.0.1"
token="chnageme"
cert="changeme"
joinCmd="sudo kubeadm join $master_ip:6443 --token $token --discovery-token-ca-cert-hash $cert"

echo $joinCmd
$joinCmd

sleep 20 # wait to start up

# 2. Setup .kube directory
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/kubelet.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# 3. Setup pod network
export KUBECONFIG=$HOME/.kube/config
echo "export KUBECONFIG=$HOME/.kube/config" | tee -a ~/.bashrc

# 4. Other stuff related to fission
sudo chown $(id -u):$(id -g) /var/lib/kubelet/pki/kubelet-client.key
export FISSION_NAMESPACE=fission
echo "export FISSION_NAMESPACE=fission" | tee -a ~/.bashrc
