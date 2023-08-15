{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    alacritty

    (callPackage ./my-pkgs/ttf-ligaconsolas-nerd-font.nix {})
  ];

  fonts.fontconfig.enable = true;

  imports = [
    ./common.nix
    ./config/alacritty.nix
    ./config/dconf.nix
  ];
}
