# Quickly edit common config files
alias fishe "pushd ~/.config/fish && nvim && popd"
alias nvime "pushd ~/.config/nvim && nvim && popd"

# Verbose output, ask when overwrite, recursive options
alias mv "mv -iv"
alias cp "cp -riv"
alias mkdir "mkdir -vp"

# LS with human-readable file sizes, icons and colors
alias ls "ls --color=auto"
abbr la "ls -A"
abbr lla "ls -al"
abbr ll "ls -l"

# SSH / AutoSSH
alias ssh "autossh -M 0"
abbr sshpc "ssh rick@littel.me -p 50505"
abbr sshprox "ssh -N -D 9090 rick@littel.me -p 50505"

# Fuck
abbr f "fuck --yeah"
