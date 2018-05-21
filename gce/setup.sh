#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
cd $SCRIPTPATH

../global/setup.sh

./install_k8s.sh

# On master node, run this:
# ./k8s_master_start.sh

# On other nodes, run the join command provided by the master
# sudo kubeadm join <master_ip>:6443 --token <token> --discovery-token-ca-cert-hash <cert-has>
