#!/bin/bash

MEMTIER_DIR=${HOME}/memtier_benchmark

git clone https://github.com/PlatformLab/memtier_benchmark.git ${MEMTIER_DIR}
cd ${MEMTIER_DIR}
git fetch
# git checkout Arachne
autoreconf -ivf
./configure
make -j32

# Install skewed one
MEMTIER_DIR=${HOME}/memtier_benchmark_skew

git clone https://github.com/PlatformLab/memtier_benchmark.git ${MEMTIER_DIR}
cd ${MEMTIER_DIR}
git fetch
git checkout skewed
ln -s ${HOME}/arachne-all arachne-all
autoreconf -ivf
./configure
make -j32

# Install synthetic benchmark
MEMTIER_DIR=${HOME}/memtier_benchmark_synthetic

git clone https://github.com/PlatformLab/memtier_benchmark.git ${MEMTIER_DIR}
cd ${MEMTIER_DIR}
git fetch
git checkout synthetic
ln -s ${HOME}/arachne-all arachne-all
autoreconf -ivf
./configure
make -j32
