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
git clone https://github.com/zhouzhuojie/Nitrous.Dotfiles.git dotfiles
cp dotfiles/.bashrc ~/
cp dotfiles/.gitconfig ~/
cp dotfiles/.tmux.conf ~/
cp dotfiles/.vimrc ~/
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
cp dotfiles/.zshrc ~/
chsh -s /bin/zsh

# Node.js
sudo apt-get install -y build-essential libssl-dev curl
curl https://raw.github.com/creationix/nvm/master/install.sh | sh
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
sudo easy_install pip
sudo pip install ipython scipy numpy networkx
