#!/bin/bash
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

echo -n "  Installing clang-format"
cp $SCRIPTPATH/clang-format ~/
ln -s $SCRIPTPATH/.clang-format ~/
echo "SUCCESS"

echo -n "  Installing smux and cluster shell"
cp $SCRIPTPATH/smux.py ~/
cp $SCRIPTPATH/clustershell.py ~/
echo "SUCCESS"

echo -n "  Installing bash configuration... "
cat >> ~/.bashrc <<EOM
source $SCRIPTPATH/.bashrc
EOM
echo "SUCCESS"

echo "Setup finished successfully!"
