#!/usr/bin/env bash

echo ""

if ! [[ -x "$(command -v emacs)" ]]; then
  echo "emacs not found. Is it installed?" >&2
  exit
fi

rm -rf ~/.emacs.d

mkdir ~/.emacs.d
ln -s ~/repos/editors/init.el ~/.emacs.d/init.el
mkdir ~/.emacs.d/lisp

echo "Install dependencies:"

# C/C++
sudo apt-get install clang libclang-dev global cmake xclip
./emacs_pkgs.el

mkdir /tmp/irony
cd /tmp/irony
cmake -DCMAKE_INSTALL_PREFIX\=~/.emacs.d/irony/ `find ~/.emacs.d/elpa -maxdepth 1 -type d -name 'irony*'`/server && cmake --build . --use-stderr --config Release --target install
rm -rf /tmp/irony

echo "!!!!!!!!"
echo "Remember to install One Dark Pro theme for vscode"
echo "!!!!!!!!"
rm ~/.config/Code/User/settings.json
mkdir -p ~/.config/Code/User/
ln -s ~/repos/editors/vscode_settings.json ~/.config/Code/User/settings.json
