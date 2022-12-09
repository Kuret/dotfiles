if not test -e ~/.config/fish/timer.fish
  curl https://raw.githubusercontent.com/jichu4n/fish-command-timer/master/conf.d/fish_command_timer.fish --output ~/.config/fish/timer.fish
end

source ~/.config/fish/timer.fish

