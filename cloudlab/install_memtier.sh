#!/bin/bash

git clone https://github.com/PlatformLab/memtier_benchmark.git
cd memtier_benchmark
git fetch
git checkout Arachne
autoreconf -ivf
./configure
make
sudo make install