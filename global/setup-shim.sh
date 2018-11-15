#!/bin/bash

# setup-shim is the lightweight setup, not installing clang-format or clustershell

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
cd $SCRIPTPATH

echo "Running setup..."

echo -n "  Installing git configuration... "
ln -s $SCRIPTPATH/.gitconfig ~/
echo "SUCCESS"

echo -n "  Installing vim configuration... "
ln -s $SCRIPTPATH/.vimrc ~/
ln -s $SCRIPTPATH/.vim ~/
echo "SUCCESS"

echo -n "  Installing bash configuration... "
cat >> ~/.bashrc <<EOM
source $SCRIPTPATH/.bashrc-shim
EOM
echo "SUCCESS"

echo "Setup finished successfully!"
