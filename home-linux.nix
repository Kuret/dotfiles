{ config, pkgs, ... }:

{
  home.homeDirectory = "/home/rick";

  home.packages = with pkgs; [
    alacritty

    # Consolas ligaturized font
    (callPackage ./my-pkgs/ttf-ligaconsolas-nerd-font.nix {})
  ];

  fonts.fontconfig.enable = true;

  imports = [
    ./common.nix
    ./config/alacritty.nix
    ./config/dconf.nix
  ];
}
