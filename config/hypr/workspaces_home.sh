HOME="desc:LG Electronics LG TV SSCR2"
DUO_TOP="desc:Stargate Technology DP"

hyprctl dispatch moveworkspacetomonitor 1 $HOME
hyprctl dispatch moveworkspacetomonitor 2 $HOME
hyprctl dispatch moveworkspacetomonitor 3 $HOME
hyprctl dispatch moveworkspacetomonitor 4 $HOME
hyprctl dispatch moveworkspacetomonitor 5 $HOME

hyprctl dispatch moveworkspacetomonitor 6 $DUO_TOP
hyprctl dispatch moveworkspacetomonitor 7 $DUO_TOP
hyprctl dispatch moveworkspacetomonitor 8 $DUO_TOP
hyprctl dispatch moveworkspacetomonitor 9 $DUO_TOP
hyprctl dispatch moveworkspacetomonitor 10 $DUO_TOP

hyprctl dispatch workspace 6
hyprctl dispatch workspace 1
