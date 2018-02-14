#!/bin/bash

##### Install arachne-all
ARACHNE_DIR=${HOME}/arachne-all

git https://github.com/PlatformLab/arachne-all.git ${ARACHNE_DIR}
cd ${ARACHNE_DIR}
git submodule update --init --recursive

### Update CoreArbiter
cd CoreArbiter
git checkout master
git pull origin master

cd ../Arachne
git checkout master
git pull origin master

cd ../ArachnePerfTests
git checkout master
git pull origin master

cd ..
./buildAll.sh
