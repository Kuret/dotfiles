#!/bin/sh
mkdir ~/.config &>/dev/null
mkdir ~/.config/ctags &>/dev/null
mkdir ~/.config/nvim &>/dev/null
mkdir ~/.config/fish &>/dev/null

sudo ln -sf $HOME/dotfiles/config/iex.exs $HOME/.iex.exs
sudo ln -sf $HOME/dotfiles/config/ctags $HOME/.config/ctags/default.ctags

sudo ln -sf $HOME/dotfiles/config/git $HOME/.config/git

sudo ln -sf $HOME/dotfiles/config/nvim/init.lua $HOME/.config/nvim/init.lua

sudo ln -sf $HOME/dotfiles/config/fish/config.fish $HOME/.config/fish/config.fish
sudo ln -sf $HOME/dotfiles/config/fish/functions $HOME/.config/fish
sudo ln -sf $HOME/dotfiles/config/fish/conf.d $HOME/.config/fish
