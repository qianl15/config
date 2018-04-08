#!/bin/bash

MEMTIER_DIR=${HOME}/memtier_benchmark

git clone https://github.com/PlatformLab/memtier_benchmark.git ${MEMTIER_DIR}
cd ${MEMTIER_DIR}
git fetch
# git checkout Arachne
autoreconf -ivf
./configure
make -j32

# Install skewed and synthetic workload
MEMTIER_DIR=${HOME}/memtier_benchmark_skewsyn

git clone https://github.com/PlatformLab/memtier_benchmark.git ${MEMTIER_DIR}
cd ${MEMTIER_DIR}
git fetch
git checkout skewSynthetic
ln -s ${HOME}/arachne-all arachne-all
autoreconf -ivf
./configure
make -j32

