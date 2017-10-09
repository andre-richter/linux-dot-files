#!/usr/bin/env bash

################
# Emacs
################
mkdir ~/.emacs.d
ln -s ~/repos/editors/init.el.light ~/.emacs.d/init.el
mkdir ~/.emacs.d/lisp

if ! [[ -x "$(command -v emacs)" ]]; then
  echo "emacs not found. Is it installed?" >&2
  exit
fi

./emacs_pkgs_light.el
