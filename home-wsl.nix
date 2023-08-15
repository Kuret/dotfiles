{ config, pkgs, ... }:

{
  home.homeDirectory = "/home/rick";

  imports = [
    ./common.nix
    ./config/wsl.nix
  ];
}
