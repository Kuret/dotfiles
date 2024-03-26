{ pkgs, ... }:

{
  programs.gh.enable = true;

  programs.git.enable = true;
  programs.git.userEmail = "rick@littel.me";
  programs.git.userName = "Rick Littel";
  programs.git.ignores = [ "shell.nix" "tags" ".iex.exs" ".mise.local.toml" ];

  programs.fish.shellAbbrs = {
    # Git
    ga  = "git add";
    gaa = "git add --all";
    gap = "git add -p";
    gc = "git commit -m";
    gca = "git commit --amend";
    gcd = "git checkout development";
    gcm = "git checkout master";
    gcma = "git checkout main";
    gco = "git checkout";
    ghpr = "gh pr create -w";
    gl = "git log";
    gld = "git log --graph --oneline origin/development..";
    glm = "git log --graph --oneline origin/master..";
    glma = "git log --graph --oneline origin/main..";
    gp = "git push";
    gpf = "git push -f";
    gpr = "git pull --rebase";
    grod = "git fetch -p; git rebase origin/development";
    grom = "git fetch -p; git rebase origin/master";
    groma = "git fetch -p; git rebase origin/main";
    gst = "git status";
  };

  programs.fish.functions = {
    # Check if git rebase strings are still present
    git-rebase-strings = "rg \"(<<<<|>>>>)\" || echo \"No rebase strings found\"";
  };
}
