#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
cd $SCRIPTPATH

../global/setup.sh

# Install some essential package
sudo apt-get install -y gcc zip

./install_k8s.sh

# On master node, run this:
# ./k8s_master_start.sh

# On other nodes:
# ./k8s_client_start.sh

