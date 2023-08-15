{ pkgs, ... }:

{
  programs.fish = {
    shellAliases = {
      choco = "choco.exe";
    };
  };
}
