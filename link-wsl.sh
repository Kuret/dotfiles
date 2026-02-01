#!/bin/sh
mkdir -p ~/.config/fish &>/dev/null
mkdir -p ~/.config/nvim &>/dev/null

ln -sf $HOME/dotfiles/config/git $HOME/.config/git
ln -sf $HOME/dotfiles/config/iex.exs $HOME/.iex.exs

ln -sf $HOME/dotfiles/config/fish/config.fish $HOME/.config/fish/config.fish
ln -sf $HOME/dotfiles/config/fish/functions $HOME/.config/fish
ln -sf $HOME/dotfiles/config/fish/conf.d $HOME/.config/fish

ln -sf $HOME/dotfiles/config/nvim/init.lua $HOME/.config/nvim/init.lua
