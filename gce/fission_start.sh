#!/bin/bash

# Change to your own account!
hubName="qianl15"

# Run this script on the master node!
scriptPATH=$(dirname $(readlink -f $0))

masterIP=$(ifconfig ens4 | grep Mask | awk '{print $2}'| cut -f2 -d:)
echo "Start Fission services on master, ens4 ip: $masterIP"

fissionPATH=$GOPATH/src/github.com/fission/fission
# 1. Init
git clone https://github.com/qianl15/fission-s.git ${fissionPATH}

# 2. Install go-1.10
# https://tecadmin.net/install-go-on-ubuntu/
sudo apt-get update
wget https://dl.google.com/go/go1.10.1.linux-amd64.tar.gz
sudo tar -xvf go1.10.1.linux-amd64.tar.gz
sudo mv go /usr/local
mkdir -p $HOME/gocode
export GOROOT=/usr/local/go
export GOPATH=$HOME/gocode
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

cat >> $HOME/.bashrc <<EOM
export GOROOT=/usr/local/go
export GOPATH=$HOME/gocode
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

EOM

# check version
go version

# 3. Install glide
sudo add-apt-repository ppa:masterminds/glide && sudo apt-get update
sudo apt-get install glide

# 4. Install helm
./install_helm.sh

# 5. compile Fission
cd $fissionPATH
glide install -v

################ Uncomment if you want to start Fission server
#helm install --set "image=${hubName}/fission-bundle,pullPolicy=Always,analytics=false" charts/fission-all --namespace fission

#### Install Fission CLI
cd $fissionPATH/fission
./install-cli.sh
