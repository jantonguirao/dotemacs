#!/bin/bash

# Add main file to your .emacs file
echo ';; My dotemacs repository' >> $HOME/.emacs
echo '(load-file "~/.emacs.d/dotemacs/dotemacs.el")' >> $HOME/.emacs

# Symlink to the project in emacs directory
ln -s $PWD ~/.emacs.d/dotemacs
