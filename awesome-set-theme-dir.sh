#!/bin/bash 

echo $HOME

mkdir -p $HOME/.config/awesome 

cd $HOME/.config/awesome/


git clone --recurse-submodules --remote-submodules --depth 1 -j 2 https://github.com/lcpz/awesome-copycats.git
mv -bvi awesome-copycats/* ~/.config/awesome; rm -rf awesome-copycats
