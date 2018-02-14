#!/bin/bash

MEMTIER_DIR=${HOME}/memtier_benchmark

git clone https://github.com/PlatformLab/memtier_benchmark.git ${MEMTIER_DIR}
cd ${MEMTIER_DIR}
git fetch
git checkout Arachne
autoreconf -ivf
./configure
make
sudo make install

