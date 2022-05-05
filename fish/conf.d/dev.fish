# Use en_US as locale
set -gx LC_ALL en_US.UTF-8

# Keep IEx Shell History
set -Ux ERL_AFLAGS "-kernel shell_history enabled"

set -Ux KERL_CONFIGURE_OPTIONS "--disable-hipe --without-javac"
[ (uname) = "Darwin" ] && set -Ux KERL_CONFIGURE_OPTIONS $KERL_CONFIGURE_OPTIONS "--with-ssl="(brew --prefix openssl@1.1)

set -Ux MAKEFLAGS "-j16"
set -Ux CFLAGS "-O2 -g -fno-stack-check"

# Set neovim as editor
set -gx VISUAL nvim
set -gx EDITOR nvim

# # # # # # # # # # # #
# Development aliases #
# # # # # # # # # # # #

# Elixir
abbr iem "iex -S mix"
abbr mdg "mix deps.get"
abbr mixg "mix gettext.setup"
abbr mps "iex -S mix phx.server"
abbr mup "npm install && npm run-script build && mix do deps.get, ecto.migrate"
abbr mups "npm install && npm run-script build && mix do deps.get, ecto.migrate && iex -S mix phx.server"
abbr mtf "mix test --failed --trace"
abbr mtt "mix test --stale --trace"
abbr mt "mix test --stale"

# Git
abbr ga "git add"
abbr gaa "git add --all"
abbr gap "git add -p"
abbr gc "git commit -m"
abbr gca "git commit --amend"
abbr gcd "git checkout development"
abbr gcm "git checkout master"
abbr gcma "git checkout main"
abbr gco "git checkout"
abbr ghpr "gh pr create -w"
abbr gl "git log"
abbr gld "git log --graph --oneline origin/development.."
abbr glm "git log --graph --oneline origin/master.."
abbr glma "git log --graph --oneline origin/main.."
abbr gp "git push"
abbr gpf "git push -f"
abbr gpr "git pull --rebase"
abbr grod "git fetch -p; git rebase origin/development"
abbr grom "git fetch -p; git rebase origin/master"
abbr groma "git fetch -p; git rebase origin/main"
abbr gst "git status"
