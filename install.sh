#!/bin/sh

# making sure stow doesn't create symlinks of directories that will be filled by programms

mkdir ~/.vim ~/.vim/dirs ~/.vim/dirs/tmp ~/.vim/dirs/backups ~/.vim/dirs/undodir

mkdir ~/.mpd

mkdir ~/.config

mkdir -p ~/.local/share/applications

stow ./ -t ~ -v
