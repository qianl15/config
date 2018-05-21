#!/bin/bash

scriptPATH=$(dirname $(readlink -f $0))
cd ${scriptPATH}

masterIP=$(ifconfig ens4 | grep Mask | awk '{print $2}'| cut -f2 -d:)
echo "Start kubernetes master on ens4 ip: $masterIP"

# 1. Init
sudo kubeadm init --pod-network-cidr=10.244.0.0/16 \
  --apiserver-advertise-address=${masterIP} --kubernetes-version stable-1.10

# 2. Setup .kube directory
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# 3. Setup pod network
export KUBECONFIG=$HOME/.kube/config
echo "export KUBECONFIG=$HOME/.kube/config" | tee -a ~/.bashrc

kubectl apply -f ${scriptPATH}/kube-flannel.yml 
kubectl apply -f ${scriptPATH}/kube-flannel-rbac.yml
