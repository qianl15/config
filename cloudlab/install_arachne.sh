#!/bin/bash

##### Install arachne-all
ARACHNE_DIR=${HOME}/arachne-all

git clone https://github.com/PlatformLab/arachne-all.git ${ARACHNE_DIR}
cd ${ARACHNE_DIR}
git submodule update --init --recursive

### Update submodules
cd PerfUtils
git checkout master
git pull origin master

cd ../CoreArbiter
git checkout master
git pull origin master

cd ../Arachne
git checkout master
git pull origin master

cd ../ArachnePerfTests
git checkout master
git pull origin master

cd ../arachne-sosp2017-benchmarks
git checkout master
git pull origin master

cd ..
./buildAll.sh
