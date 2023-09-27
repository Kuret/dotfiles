{ pkgs, ... }:

{
  home.sessionVariables = {
    # Allow insecure/unfree packages
    NIXPKGS_ALLOW_INSECURE = "1";
    NIXPKGS_ALLOW_UNFREE = "1";

    # Do not track
    DO_NOT_TRACK = "1";
    HOMEBREW_NO_ANALYTICS = "1";
    DOTNET_CLI_TELEMETRY_OPTOUT = "1";

    # Path
    PATH = "$PATH:$HOME/bin";
  };

  programs.direnv.enable = true;
  programs.zoxide.enable = true;
  programs.zoxide.enableFishIntegration = true;

  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting

      fenv source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
      any-nix-shell fish --info-right | source

      # Remove default aliases from copilot-cli plugin
      functions -e !! git! gh!
    '';

    shellAliases = {
      mv = "mv -iv";
      cp = "cp -riv";
      mkdir = "mkdir -vp";
      ls = "ls --color=auto";

      "," = "__copilot_what-the-shell";
      ",g" = "__copilot_git-assist";
      ",gh" = "__copilot_gh-assist";
    };

    shellAbbrs = {
      # ls
      la = "ls -A";
      lla = "ls -al";
      ll = "ls -l";

      # Heroku
      hr = "heroku restart -a";
    };

    functions = {
      # Restart detroit- app
      hrd = "heroku restart -a detroit-$argv[1]";

      # Run command N times
      run = ''
        set number $argv[1]

        for i in (seq $number)
          eval $argv[2..-1]
        end
      '';
    };

    plugins = [
      {
        name = "fish-command-timer";
        src = pkgs.fetchFromGitHub {
          owner = "jichu4n";
          repo = "fish-command-timer";
          rev = "ba68bd0a1d06ea99aadefe5a4f32ff512783d432";
          sha256 = "Ip677gZlcO8L/xukD7Qoa+C+EcI2kGd+BSOi2CDOzM4=";
        };
      }

      {
        name = "lucid";
        src = pkgs.fetchFromGitHub {
          owner = "mattgreen";
          repo = "lucid.fish";
          rev = "b6aca138ce47289f2083bcb63c062d47dcaf4368";
          sha256 = "6HepVxMm9LdJoifczvQS98kAc1+RTKJh+OHRf28nhZM=";
        };
      }

      {
        name = "foreign-env";
        src = pkgs.fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "plugin-foreign-env";
          rev = "3ee95536106c11073d6ff466c1681cde31001383";
          sha256 = "11jgpklcqy8xj8dsb4j1lrwx3y34kcnmmzck6agci3jbd5gvy9dz";
        };
      }

      {
        name = "nix-env";
        src = pkgs.fetchFromGitHub {
          owner = "lilyball";
          repo = "nix-env.fish";
          rev = "7b65bd228429e852c8fdfa07601159130a818cfa";
          sha256 = "069ybzdj29s320wzdyxqjhmpm9ir5815yx6n522adav0z2nz8vs4";
        };
      }

      {
        name = "github-copilot-cli";
        src = pkgs.fetchFromGitHub {
          owner = "z11i";
          repo = "github-copilot-cli.fish";
          rev = "ccb6367bbb3055ea19b9ff0eac1ccf1c5e86419a";
          sha256 = "cnmxvnG3WN2uqtt1aUEf0OFJulQSpFd3RJeeVKpDI9Y=";
        };
      }
    ];
  };
}
