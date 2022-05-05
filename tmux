set-option -g default-command fish
set-option -g default-shell /usr/local/bin/fish

set-option -ga terminal-overrides ",screen-256color:Tc"
set -g default-terminal "screen-256color"
set -g -a terminal-overrides ',*:Ss=\E[%p1%d q:Se=\E[2 q'

set -g prefix C-a
bind C-a send-prefix
unbind C-b

bind-key \\ split-window -h
bind-key - split-window -v

bind-key -n C-h if-shell "$is_vim" "send-keys C-h"  "select-pane -L"
bind-key -n C-j if-shell "$is_vim" "send-keys C-j"  "select-pane -D"
bind-key -n C-k if-shell "$is_vim" "send-keys C-k"  "select-pane -U"
bind-key -n C-l if-shell "$is_vim" "send-keys C-l"  "select-pane -R"

# Don't prompt for killing panes and windows
bind-key x kill-pane
bind-key & kill-window

# Reload config
bind R source-file ~/.tmux.conf

# Vi Mode
setw -g mode-keys vi
set -g status-keys vi

# Set first terminal number to 1 instead of 0
set -g base-index 1
setw -g pane-base-index 1

# Automatically set window title
set-window-option -g automatic-rename on
set-option -g set-titles on

# Mouse support
set -g mouse on

# Faster escape sequence
set -sg escape-time 0
set -sg repeat-time 600

## COLORSCHEME: gruvbox dark
set-option -g status "on"

# default colors
set -g status-style bg=colour237,none,fg=colour223
set -g status-left-style bg=default,none
set -g status-right-style bg=default,none
set -g window-status-style bg=colour214,none,fg=colour237
set -g window-status-activity-style bg=colour237,none,fg=colour248
set -g window-status-current-style bg=default,fg=colour237
set -g pane-active-border-style fg=colour250
set -g pane-border-style fg=colour237
set -g message-style bg=colour239,fg=colour223
set -g message-command-style bg=colour239,fg=colour223

set-option -g status-justify "left"
set-option -g status-left-length "80"
set-option -g status-right-length "80"
set-window-option -g window-status-separator ""

# pane number display
set-option -g display-panes-active-colour colour250 #fg2
set-option -g display-panes-colour colour237 #bg1

# clock
set-window-option -g clock-mode-colour colour109 #blue

# bell
set-window-option -g window-status-bell-style fg=colour235,bg=colour167 #bg, red

set-option -g status-left "#[fg=colour248, bg=colour241] #S #[fg=colour241, bg=colour237, nobold, noitalics, nounderscore]"
set-option -g status-right "#[fg=colour239, bg=colour237, nobold, nounderscore, noitalics]#[fg=colour246,bg=colour239] %Y-%m-%d  %H:%M #[fg=colour248, bg=colour239, nobold, noitalics, nounderscore]#[fg=colour237, bg=colour248] #h "

set-window-option -g window-status-current-format "#[fg=colour239, bg=colour248, :nobold, noitalics, nounderscore]#[fg=colour239, bg=colour214] #I #[fg=colour239, bg=colour214, bold] #W #[fg=colour214, bg=colour237, nobold, noitalics, nounderscore]"
set-window-option -g window-status-format "#[fg=colour237,bg=colour239,noitalics]#[fg=colour223,bg=colour239] #I #[fg=colour223, bg=colour239] #W #[fg=colour239, bg=colour237, noitalics]"
