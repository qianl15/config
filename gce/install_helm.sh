#!/bin/bash

curl -LO https://storage.googleapis.com/kubernetes-helm/helm-v2.7.0-linux-amd64.tar.gz
tar xzf helm-v2.7.0-linux-amd64.tar.gz
sudo mv linux-amd64/helm /usr/local/bin

helm init
