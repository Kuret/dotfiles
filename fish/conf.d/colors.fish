# true color
set -l shadow  665c54
set -l normal  ebdbb2
set -l brnormal fbf1c7

set -l brgreen b8bb26
set -l brblue   83a598
set -l yellow  d79921
set -l orange  d65d0e
set -l red     cc241d
set -l magenta b16286
set -l violet  d3869b
set -l blue    458588
set -l aqua    689d6a
set -l braqua  8ec07c
set -l green   98971a

# Used by fish's completion; see
# http://fishshell.com/docs/2.0/index.html#variables-color

set -g fish_color_normal      $normal
set -g fish_color_command     $aqua
set -g fish_color_quote       $brgreen
set -g fish_color_redirection $brblue
set -g fish_color_end         $brblue
set -g fish_color_error       $red
set -g fish_color_param       $normal
set -g fish_color_comment     $brgreen
set -g fish_color_match       $aqua
set -g fish_color_search_match "--background=$normal"
set -g fish_color_operator    $orange
set -g fish_color_escape      $aqua
set -g fish_color_autosuggestion $shadow

set -gx lucid_cwd_color blue
set -gx lucid_git_color grey
set -gx lucid_prompt_symbol_color green
set -gx lucid_prompt_symbol_error_color red
