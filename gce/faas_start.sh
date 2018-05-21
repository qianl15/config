#!/bin/bash

# Run this script on the master node!
scriptPATH=$(dirname $(readlink -f $0))

masterIP=$(ifconfig ens4 | grep Mask | awk '{print $2}'| cut -f2 -d:)
echo "Start OpenFaaS services on master, ens4 ip: $masterIP"

faasPATH=$HOME/faas-netes
# 1. Init
git clone https://github.com/openfaas/faas-netes ${faasPATH}

# 2. Start services
cd ${faasPATH}
kubectl apply -f ./namespaces.yml,./yaml

# 3. Show services
kubectl get all --namespace=openfaas
