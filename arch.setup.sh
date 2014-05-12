#!/bin/bash

# Install git
sudo aura -Syu
sudo aura -S git-core vim ctags openssh wget

# Basic Env
cd $HOME
# Make dotfiles dir in setup directory
sudo aura -S tmux zsh
rm -rf _dotfiles
git clone https://github.com/zhouzhuojie/Nitrous.Dotfiles.git _dotfiles
cp _dotfiles/.bashrc ~/
cp _dotfiles/.gitconfig ~/
cp _dotfiles/.tmux.conf ~/
cp _dotfiles/.vimrc ~/
rm -rf .oh-my-zsh
rm .zshrc
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
cp _dotfiles/.arch.zshrc ~/.zshrc
chsh -s /bin/zsh
. ~/.zshrc

# Node.js
rm -rf ~/.nvm
rm -rf ~/.npm
rm -rf ~/.bower
git clone https://github.com/creationix/nvm.git ~/.nvm
. ~/.nvm/nvm.sh
nvm install 0.10
nvm use 0.10
nvm alias default 0.10
curl https://install.meteor.com | /bin/sh

# http://jshint.com/
npm install -g jshint
npm install -g meteorite
npm install -g coffee-script

# Python
sudo aura -S python2 python2-pip python2-numpy python2-scipy python2-networkx
sudo pip2 install ipython
sudo aura -Sc
