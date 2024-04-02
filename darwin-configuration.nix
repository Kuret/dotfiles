{ config, pkgs, ... }:

{
  imports = [ <home-manager/nix-darwin> ];

  # Shell
  environment.shells = [ pkgs.fish ];
  environment.loginShell = "${pkgs.fish}/bin/fish";
  environment.variables.SHELL = "${pkgs.fish}/bin/fish";
  programs.fish.enable = true;

  users.users.rick = {
    home = "/Users/rick";
    shell = pkgs.fish;
  };

  # Homebrew Packages
  homebrew.enable = true;
  homebrew.casks = [
    "whisky"
    "alt-tab"
    "swift-quit"
    "bleunlock"
    "livebook"
    "utm"
    "visual-studio-code"
  ];
  homebrew.taps = [ ];
  homebrew.brews = [
    "elixir-ls"
    "yt-dlp"
    {
      # Couldn't get the service to work using Nix's psql, using brew instead.
      name = "postgresql@14";
      restart_service = "changed";
    }

    {
      name = "cloudflared";
      restart_service = "changed";
    }
  ];

  # Home Manager
  home-manager.useGlobalPkgs = true;
  home-manager.users.rick = ./home-darwin.nix;

  # Networking
  networking.hostName = "rick-mbp";
  networking.localHostName = "rick-mbp";
  system.defaults.smb.NetBIOSName = "rick-mbp";
  system.defaults.smb.ServerDescription = "rick-mbp";

  networking.knownNetworkServices = [ "Wi-Fi" ];

  networking.dns = [
    "1.1.1.1"
    "1.0.0.1"
    "2606:4700:4700::1111"
    "2606:4700:4700::1001"
  ];

  programs.gnupg.agent.enable = true;
  programs.gnupg.agent.enableSSHSupport = true;

  # Use TouchID for sudo
  security.pam.enableSudoTouchIdAuth = true;

  # MacOS settings
  system.defaults.NSGlobalDomain.AppleShowAllExtensions = true;
  system.defaults.NSGlobalDomain.AppleShowAllFiles = true;
  system.defaults.NSGlobalDomain.AppleShowScrollBars = "WhenScrolling";
  system.defaults.NSGlobalDomain.AppleWindowTabbingMode = "always";
  system.defaults.dock.autohide = true;
  system.defaults.dock.largesize = 64;
  system.defaults.dock.magnification = true;
  system.defaults.dock.minimize-to-application = true;
  system.defaults.dock.show-recents = false;
  system.defaults.dock.tilesize = 32;
  system.defaults.dock.wvous-bl-corner = 1;
  system.defaults.dock.wvous-br-corner = 1;
  system.defaults.dock.wvous-tl-corner = 1;
  system.defaults.dock.wvous-tr-corner = 1;
  system.defaults.finder.AppleShowAllExtensions = true;
  system.defaults.finder.AppleShowAllFiles = true;
  system.defaults.finder.CreateDesktop = false;
  system.defaults.finder.FXEnableExtensionChangeWarning = false;
  system.defaults.finder._FXShowPosixPathInTitle = true;
  system.defaults.loginwindow.GuestEnabled = false;
  system.defaults.loginwindow.SHOWFULLNAME = false;
  system.defaults.screencapture.disable-shadow = true;
  system.defaults.screensaver.askForPasswordDelay = 0;
  system.defaults.spaces.spans-displays = false;
  system.defaults.".GlobalPreferences"."com.apple.mouse.scaling" = -1.0;
  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToEscape = true;
  time.timeZone = "Europe/Amsterdam";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  # Nix garbage collection
  nix.gc.automatic = true;
  nix.gc.interval = { Weekday = 0; };
  nix.gc.options = "--delete-older-than 30d";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = 4;
}
