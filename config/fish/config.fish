set -gx DO_NOT_TRACK 1
set -gx HOMEBREW_NO_ANALYTICS 1
set -gx DOTNET_CLI_TELEMETRY_OPTOUT 1
set -gx MISE_ASDF_COMPAT 1
set -gx KERL_CONFIGURE_OPTIONS "--without-javac --without-odbc"
set -gx PATH "$PATH:$HOME/bin"

# Abbreviations
abbr --add -- asdf mise
abbr --add -- ga 'git add'
abbr --add -- gaa 'git add --all'
abbr --add -- gap 'git add -p'
abbr --add -- gc 'git commit -m'
abbr --add -- gca 'git commit --amend'
abbr --add -- gcd 'git checkout development'
abbr --add -- gcm 'git checkout master'
abbr --add -- gcma 'git checkout main'
abbr --add -- gco 'git checkout'
abbr --add -- ghpr 'gh pr create -w'
abbr --add -- gl 'git log'
abbr --add -- gld 'git log --graph --oneline origin/development..'
abbr --add -- glm 'git log --graph --oneline origin/master..'
abbr --add -- glma 'git log --graph --oneline origin/main..'
abbr --add -- gp 'git push'
abbr --add -- gpf 'git push -f'
abbr --add -- gpr 'git pull --rebase'
abbr --add -- grod 'git fetch -p; git rebase origin/development'
abbr --add -- grom 'git fetch -p; git rebase origin/master'
abbr --add -- groma 'git fetch -p; git rebase origin/main'
abbr --add -- gst 'git status'
abbr --add -- hr 'heroku restart -a'
abbr --add -- iem 'iex -S mix'
abbr --add -- la 'ls -A'
abbr --add -- ll 'ls -l'
abbr --add -- lla 'ls -al'
abbr --add -- mixg 'mix gettext.run'
abbr --add -- mps 'iex -S mix phx.server'
abbr --add -- mup 'npm install && npm run-script build && mix do deps.get, ecto.migrate'
abbr --add -- mups 'npm install && npm run-script build && mix do deps.get, ecto.migrate && iex -S mix phx.server'
abbr --add -- tmux 'tmux -CC new -A -s dev'
abbr --add -- ytdl 'yt-dlp -x -f bestaudio --audio-format aac'

# Aliases
alias mv 'mv -iv'
alias cp 'cp -riv'
alias mkdir 'mkdir -vp'
alias ls 'ls --color=auto'

# Interactive shell initialisation
set fish_greeting

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Mise
mise activate fish | source

# FZF
fzf --fish | source

zoxide init fish | source
