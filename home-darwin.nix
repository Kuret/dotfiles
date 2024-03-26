{ config, pkgs, ... }:

{
  home.homeDirectory = "/Users/rick";

  home.packages = with pkgs; [
    heroku
    imagemagick

    openssl cmake autoconf terminal-notifier

    darwin.apple_sdk.frameworks.CoreFoundation
    darwin.apple_sdk.frameworks.CoreServices

    # Consolas ligaturized font
    (callPackage ./my-pkgs/ttf-ligaconsolas-nerd-font.nix {})
  ];

  fonts.fontconfig.enable = true;

  programs.fish = {
    shellAbbrs = {
      update-nix = "nix-channel --update && darwin-rebuild switch";
    };
  };

  imports = [
    ./common.nix
    ./config/alacritty.nix
    ./config/kitty.nix
  ];
}
