#!/bin/bash

##### Install from memcached released package
# wget http://www.memcached.org/files/memcached-1.5.4.tar.gz
# tar -zxf memcached-1.5.4.tar.gz
# cd memcached-1.5.4
# ./configure --prefix=/usr/local/memcached
# make && make test && make install

##### Install from our code
# ./install_arachne.sh

MEMCACHE_DIR=${HOME}/memcached-scheme1
git clone https://github.com/PlatformLab/memcached.git ${MEMCACHE_DIR}
cd ${MEMCACHE_DIR}
git fetch
git checkout arachne_scheme1_timetrace_block
ln -s ${HOME}/arachne-all arachne-all
./autogen.sh
./configure --prefix=/usr/local/memcached-s1
make -j32 

MEMCACHE_DIR=${HOME}/memcached-scheme4
git clone https://github.com/PlatformLab/memcached.git ${MEMCACHE_DIR}
cd ${MEMCACHE_DIR}
git fetch
git checkout arachne_scheme4_timetrace_block
ln -s ${HOME}/arachne-all arachne-all
./autogen.sh
./configure --prefix=/usr/local/memcached-s4
make -j32

