#!/bin/sh
cd $(dirname ${0}) 

vim_home=~/.vim
mkdir -p ${vim_home}
ln -sf `pwd`/vimrc ~/.vimrc
ln -sf `pwd`/rc ${vim_home}/rc

nvim_home=~/.nvim
mkdir -p ${nvim_home}
mkdir -p ~/.config/nvim
ln -sf `pwd`/vimrc ~/.config/nvim/init.vim
ln -sf `pwd`/rc ${nvim_home}/rc