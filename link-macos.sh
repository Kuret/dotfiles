#!/bin/sh
mkdir -p ~/bin &>/dev/null

mkdir -p ~/.config/ctags &>/dev/null
mkdir -p ~/.config/fish &>/dev/null
mkdir -p ~/.config/nvim &>/dev/null

# ln -sf $HOME/dotfiles/config/bin/disable-boost $HOME/bin/disable-boost
# ln -sf $HOME/dotfiles/config/bin/enable-boost $HOME/bin/enable-boost
# ln -sf $HOME/dotfiles/config/bin/gsrun $HOME/bin/gsrun
# ln -sf $HOME/dotfiles/config/bin/screeninfo $HOME/bin/screeninfo
# ln -sf $HOME/dotfiles/config/bin/tdp $HOME/bin/tdp
# ln -sf $HOME/dotfiles/config/bin/wlrun $HOME/bin/wlrun
# ln -sf $HOME/dotfiles/config/bin/restart-touchpad $HOME/bin/restart-touchpad

chmod +x $HOME/bin/*

ln -sf $HOME/dotfiles/config/ctags $HOME/.config/ctags/default.ctags
ln -sf $HOME/dotfiles/config/git $HOME/.config/git
ln -sf $HOME/dotfiles/config/iex.exs $HOME/.iex.exs

ln -sf $HOME/dotfiles/config/fish/config.fish $HOME/.config/fish/config.fish
ln -sf $HOME/dotfiles/config/fish/functions $HOME/.config/fish
ln -sf $HOME/dotfiles/config/fish/conf.d $HOME/.config/fish

ln -sf $HOME/dotfiles/config/nvim/init.lua $HOME/.config/nvim/init.lua

# Window manager
#mkdir -p ~/.config/kanshi &>/dev/null
#mkdir -p ~/.config/plasma-workspace/env &>/dev/null

#ln -sf $HOME/dotfiles/config/hypr $HOME/.config
#ln -sf $HOME/dotfiles/config/niri $HOME/.config

#ln -sf $HOME/dotfiles/config/kanshi/config $HOME/.config/kanshi/config
#ln -sf $HOME/dotfiles/config/waybar $HOME/.config

#ln -sf $HOME/dotfiles/config/plasma-workspace/env/hdr-cursor-fix.sh $HOME/.config/plasma-workspace/env/hdr-cursor-fix.sh
# ln -sf $HOME/dotfiles/config/plasma-workspace/env/path.sh $HOME/.config/plasma-workspace/env/path.sh
#ln -sf $HOME/dotfiles/config/plasma-workspace/env/no-direct-scanout.sh $HOME/.config/plasma-workspace/env/no-direct-scanout.sh

#chmod +x $HOME/.config/waybar/*.sh
#chmod +x $HOME/.config/hypr/*.sh
