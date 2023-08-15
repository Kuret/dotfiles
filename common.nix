{ config, pkgs, ... }:

{
  home.username = "rick";
  home.homeDirectory = "/home/rick";
  home.stateVersion = "23.05";

  home.packages = with pkgs; [
    fish any-nix-shell
    nix-prefetch-git ripgrep
  ];

  # Packages installed outside of nix:
  #   heroku (stand-alone)
  #   cloudflared
  #   postgresql (-client, -contrib)
  #   cmake
  #   inotify-tools
  #   build dependencies for rtx/asdf-erlang

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = [
    ./config/fish.nix
    ./config/ctags.nix
    ./config/git.nix
    ./config/nvim.nix
    ./config/rtx.nix
    ./config/tmux.nix
  ];
}
