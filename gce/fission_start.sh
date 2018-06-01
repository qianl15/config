#!/bin/bash

# Change to your own account!
hubName="qianl15"

scriptPATH=$(dirname $(readlink -f $0))

masterIP=$(ifconfig ens4 | grep Mask | awk '{print $2}'| cut -f2 -d:)
echo "Start Fission services on master, ens4 ip: $masterIP"

# 1. Install go-1.10
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

# 2. Install glide
sudo add-apt-repository ppa:masterminds/glide && sudo apt-get update
sudo apt-get install glide

# 3. Install helm
./install_helm.sh

# 4. Install Fission
fissionPATH=$GOPATH/src/github.com/fission/fission
git clone https://github.com/qianl15/fission-s.git ${fissionPATH}

cd $fissionPATH
git checkout qianDev
glide install -v

################ Uncomment if you want to start Fission server
#helm install --set "image=${hubName}/fission-bundle,pullPolicy=Always,analytics=false" charts/fission-all --namespace fission

#### Install Fission CLI
cd $fissionPATH/fission
./install-cli.sh
