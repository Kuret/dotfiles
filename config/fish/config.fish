set -gx DO_NOT_TRACK 1
set -gx HOMEBREW_NO_ANALYTICS 1
set -gx DOTNET_CLI_TELEMETRY_OPTOUT 1
set -gx MISE_ASDF_COMPAT 1
set -gx KERL_CONFIGURE_OPTIONS "--without-javac --without-odbc"
set -gx HEROKU_SCRIPTS_OP_REF "op://Employee/hsuo6g435bdtnbwlipbcm2mqwy/api key"

# API keys and other secrets live outside this repo.
if test -f ~/.config/fish/secrets.fish
  source ~/.config/fish/secrets.fish
end

# PATH
if test (uname) = Darwin
  eval (/opt/homebrew/bin/brew shellenv fish)
  fish_add_path -pP /opt/homebrew/opt/postgresql@17/bin
  fish_add_path -aP ~/Library/Python/3.9/bin
  fish_add_path -aP /opt/homebrew/opt/python@3.11/libexec/bin
end
fish_add_path -pP ~/.local/share/mise/shims
fish_add_path -aP ~/bin
fish_add_path -aP ~/.local/bin

set -gx EDITOR nvim

# Abbreviations
if test (uname) = Darwin
  abbr --add -- allow 'xattr -d com.apple.quarantine'
end
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

# OMP
abbr --add -- ompa 'omp --prewalk-into openrouter/anthropic/claude-sonnet-5'
abbr --add -- ompp 'omp --no-prewalk'

# Aliases
alias mv 'mv -iv'
alias cp 'cp -riv'
alias mkdir 'mkdir -vp'
alias ls 'ls --color=auto'

alias c 'cursor . --enable-features=UseOzonePlatform --ozone-platform=wayland --enable-wayland-ime &>/dev/null & disown'

alias p 'powerprofilesctl launch --profile performance'
alias pb 'powerprofilesctl launch --profile balanced'

# Interactive shell initialisation
set fish_greeting

# Mise
mise activate fish | source

# FZF
fzf --fish | source

zoxide init fish | source

# Direnv
direnv hook fish | source

# 1Password shell plugins
if test -f ~/.config/op/plugins.sh
  source ~/.config/op/plugins.sh
end

if test "$DETROIT_PASEO_HOST_AGENT" = true
  set -l detroit_paseo_root (git rev-parse --show-toplevel 2>/dev/null)
  if test -x "$detroit_paseo_root/script/dev-container-tool"
    set -gx PATH "$detroit_paseo_root/script/dev-container-bin" $PATH
  end
end

# >>> llmtrim >>>
if command -q llmtrim; and llmtrim _alive 2>/dev/null
    set -gx HTTPS_PROXY 'http://127.0.0.1:43117'
    set -gx HTTP_PROXY 'http://127.0.0.1:43117'
    set -gx NO_PROXY 'localhost,127.0.0.1,::1,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16,169.254.0.0/16,fd00::/8,*.local'
    set -gx no_proxy 'localhost,127.0.0.1,::1,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16,169.254.0.0/16,fd00::/8,*.local'
    set -gx NODE_EXTRA_CA_CERTS "$HOME/.llmtrim/ca.pem"
    set -gx NODE_USE_ENV_PROXY '1'
    set -gx SSL_CERT_FILE "$HOME/.llmtrim/ca-bundle.pem"
    set -gx CURL_CA_BUNDLE "$HOME/.llmtrim/ca-bundle.pem"
end
# <<< llmtrim <<<

# Auto-disown background jobs before `exec` to suppress fish's exit warning.
function __disown_before_exec --on-event fish_preexec
    if string match -qr '^exec\b' -- $argv[1]
        for j in (jobs -p)
            builtin disown $j 2>/dev/null
        end
    end
end
