{ config, pkgs, ... }:

{
  home.username = "rick";
  home.stateVersion = "23.05";

  home.packages = with pkgs; [
    fish any-nix-shell
    nix-prefetch-github ripgrep wget
    github-copilot-cli
    unar
    openssl gcc cmake autoconf automake gnumake
  ];

  # Packages installed outside of nix:
  #   heroku (stand-alone)
  #   cloudflared
  #   postgresql (-client, -contrib)
  #   cmake
  #   inotify-tools
  #   imagemagick
  #   wslu / xdg-open (for opening links from WSL2)
  #   build dependencies for mise/asdf-erlang

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = [
    ./config/fish.nix
    ./config/ctags.nix
    ./config/git.nix
    ./config/nvim.nix
    ./config/dev.nix
    ./config/tmux.nix
  ];
}
