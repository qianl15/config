#!/bin/bash

##### Install from memcached released package
# wget http://www.memcached.org/files/memcached-1.5.4.tar.gz
# tar -zxf memcached-1.5.4.tar.gz
# cd memcached-1.5.4
# ./configure --prefix=/usr/local/memcached
# make && make test && make install

##### Install from our code
git clone https://github.com/PlatformLab/memcached.git
cd memcached
git fetch
git checkout arachne_kernel_dispatcher
./autogen.sh
./configure --prefix=/usr/local/memcached
make 
make test
sudo make install