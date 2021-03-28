#!/usr/bin/env bash
set -e

# create nvim folder, if not exist
mkdir -p "${HOME}"/.config/nvim

# create symlink
ln -sfv "${HOME}"/dotfiles/nvim/init.vim "${HOME}"/.config/nvim

rm -Rf "${HOME}"/dotfiles/nvim/Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git "${HOME}"/dotfiles/nvim/Vundle.vim
ln -sfv "${HOME}"/dotfiles/nvim/Vundle "${HOME}"/.vim/bundle/Vundle.vim

# install plugins
nvim +PluginInstall +qall
