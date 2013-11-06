#!/bin/bash
# Simple setup.sh for configuring Ubuntu 13.04
# for headless setup. for my personal Linux computer

# Install git
sudo apt-get install -y git-core

# install ssh ( for remote login to this machine )
sudo apt-get install -y ssh

# Basic Env
cd $HOME
# Make dotfiles dir in setup directory
sudo apt-get install -y tmux vim zsh
rm -rf _dotfiles
git clone https://github.com/zhouzhuojie/Nitrous.Dotfiles.git _dotfiles
cp _dotfiles/.bashrc ~/
cp _dotfiles/.gitconfig ~/
cp _dotfiles/.tmux.conf ~/
cp _dotfiles/.vimrc ~/
rm -rf .oh-my-zsh
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
cp _dotfiles/.zshrc ~/
chsh -s /bin/zsh
. ~/.zshrc

# Node.js
sudo apt-get install -y build-essential libssl-dev curl
curl https://raw.github.com/creationix/nvm/master/install.sh | sh
. ~/.nvm/nvm.sh
nvm install 0.10.21
nvm use 0.10.21
nvm alias default 0.10.21
curl https://install.meteor.com | /bin/sh

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
npm install -g jshint
npm install -g meteorite
npm install -g coffee-script

# Python
sudo apt-get install -y python-setuptools python-numpy python-scipy python-networkx
sudo easy_install pip
sudo pip install ipython
