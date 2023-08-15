{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
  ];

  imports = [
    ./common.nix
    ./wsl.nix
  ];
}
