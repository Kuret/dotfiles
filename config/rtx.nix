{ pkgs, ... }:

{
  home.sessionVariables = {
    # Write ASDF-Compatible .tool-versions file for RTX
    RTX_ASDF_COMPAT= "1";
  };

  programs.rtx.enable = true;
  programs.rtx.enableFishIntegration = true;

  programs.fish.shellAbbrs = {
    # Elixir
    iem = "iex -S mix";
    mixg = "mix gettext.run";
    mps = "iex -S mix phx.server";
    mup = "npm install && npm run-script build && mix do deps.get, ecto.migrate";
    mups = "npm install && npm run-script build && mix do deps.get, ecto.migrate && iex -S mix phx.server";

    # ASDF/RTX
    asdf = "rtx";
  };
}
