#!/bin/sh
# Link dotfiles into place on a Linux machine. Safe to re-run: existing real
# files or directories are moved aside to *.bak before the symlink is made.
set -eu

link() { # link <source> <target>
  src="$1"; dst="$2"
  mkdir -p "$(dirname "$dst")"
  if [ -e "$dst" ] && [ ! -L "$dst" ]; then
    mv "$dst" "$dst.bak"
  fi
  ln -sfn "$src" "$dst"
}

D="$HOME/dotfiles/config"

link "$D/git"                 "$HOME/.config/git"
link "$D/iex.exs"             "$HOME/.iex.exs"
link "$D/fish/config.fish"    "$HOME/.config/fish/config.fish"
link "$D/fish/functions"      "$HOME/.config/fish/functions"
link "$D/fish/conf.d"         "$HOME/.config/fish/conf.d"
link "$D/nvim/init.lua"       "$HOME/.config/nvim/init.lua"

# Helper scripts
mkdir -p "$HOME/bin"
for f in "$D"/bin/*; do
  link "$f" "$HOME/bin/$(basename "$f")"
done
chmod +x "$D"/bin/*

# Window manager configs, only where the compositor is installed
command -v hyprland >/dev/null 2>&1 && link "$D/hypr"   "$HOME/.config/hypr"
command -v niri     >/dev/null 2>&1 && link "$D/niri"   "$HOME/.config/niri"
command -v waybar   >/dev/null 2>&1 && link "$D/waybar" "$HOME/.config/waybar"
command -v kanshi   >/dev/null 2>&1 && link "$D/kanshi/config" "$HOME/.config/kanshi/config"

# Plasma env scripts are hardware-specific (GPD Duo HDR fixes); link by hand:
#   link "$D/plasma-workspace/env/hdr-cursor-fix.sh" "$HOME/.config/plasma-workspace/env/hdr-cursor-fix.sh"
#   link "$D/plasma-workspace/env/no-direct-scanout.sh" "$HOME/.config/plasma-workspace/env/no-direct-scanout.sh"

echo "dotfiles linked"
