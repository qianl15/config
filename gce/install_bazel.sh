#!/bin/bash

# Script to install Bazel: https://bazel.build/
set -x
set -e

# 1. Install the JDK
sudo apt-get install -y openjdk-8-jdk

# 2. Add Bazel distribution URI as a package source.
echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list
curl https://bazel.build/bazel-release.pub.gpg | sudo apt-key add -

# Install Bazel
sudo apt-get update && sudo apt-get install bazel

# You can upgrade Bazel:
# sudo apt-get install --only-upgrade bazel
