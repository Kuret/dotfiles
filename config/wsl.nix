{ pkgs, ... }:

{
  programs.fish = {
    shellAliases = {
      choco = "choco.exe";
      explorer = "explorer.exe";
    };

    shellAbbrs = {
      update-all = "sudo apt update && sudo apt upgrade && nix-channel --update && home-manager switch && choco upgrade all && wsl.exe --update";

      update-apt = "sudo apt update && sudo apt upgrade";
      update-nix = "nix-channel --update && home-manager switch";
      update-win = "choco upgrade all && wsl.exe --update";
    };
  };
}
