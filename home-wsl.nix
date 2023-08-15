{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
  ];

  imports = [
    ./common.nix
    ./config/wsl.nix
  ];
}
