#!/usr/bin/env bash
set -e
sudo -v

# Fetch script path
pushd . > /dev/null
SCRIPT_PATH="${BASH_SOURCE[0]}"
if ([ -h "${SCRIPT_PATH}" ]); then
  while([ -h "${SCRIPT_PATH}" ]); do cd `dirname "$SCRIPT_PATH"`;
  SCRIPT_PATH=`readlink "${SCRIPT_PATH}"`; done
fi
cd `dirname ${SCRIPT_PATH}` > /dev/null
SCRIPT_PATH=`pwd`;
popd  > /dev/null

# Helper for symlinking dotfiles
symlink() {
  rm -rf $2
  dir=$(dirname $2)

  if [ ! -d "$dir" ]; then
    mkdir -p "$dir"
  fi

  if [ ! -L $2 ]; then
    ln -sfn $1 $2
  fi
}


echo "=================================================="
echo "Linking Dotfiles"
echo "=================================================="

# Home directory
# symlink ${SCRIPT_PATH}/bin ~/bin;
symlink ${SCRIPT_PATH}/bin/prox ~/bin/prox;

symlink ${SCRIPT_PATH}/gitconfig ~/.gitconfig;

symlink ${SCRIPT_PATH}/ssh/id_rick.pub ~/.ssh/id_rick.pub;
symlink ${SCRIPT_PATH}/ssh/config ~/.ssh/config;

# symlink ${SCRIPT_PATH}/tmux ~/.tmux.conf;

# Config directory
symlink ${SCRIPT_PATH}/alacritty ~/.config/alacritty/alacritty.yml;

symlink ${SCRIPT_PATH}/fish/conf.d ~/.config/fish/conf.d;
symlink ${SCRIPT_PATH}/fish/functions ~/.config/fish/functions;

symlink ${SCRIPT_PATH}/nvim/init.lua ~/.config/nvim/init.lua;
symlink ${SCRIPT_PATH}/nvim/lua ~/.config/nvim/lua;

# Special Permissions
chmod 600 ~/.ssh/*
chmod +x ~/bin/*
