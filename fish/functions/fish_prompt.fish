function fish_prompt
  if not test -e ~/.config/fish/prompt.fish
    curl https://raw.githubusercontent.com/mattgreen/lucid.fish/master/functions/fish_prompt.fish --output ~/.config/fish/prompt.fish
  end

  source ~/.config/fish/prompt.fish && fish_prompt
end
