WORK="desc:Dell Inc. DELL U2720Q"
DUO_TOP="desc:Stargate Technology DP"
DUO_BOTTOM="desc:Samsung Display Corp. 0x4166"

hyprctl dispatch moveworkspacetomonitor 1 $WORK
hyprctl dispatch moveworkspacetomonitor 2 $WORK
hyprctl dispatch moveworkspacetomonitor 3 $WORK
hyprctl dispatch moveworkspacetomonitor 4 $WORK
hyprctl dispatch moveworkspacetomonitor 5 $WORK

hyprctl dispatch moveworkspacetomonitor 6 $DUO_TOP
hyprctl dispatch moveworkspacetomonitor 7 $DUO_TOP
hyprctl dispatch moveworkspacetomonitor 8 $DUO_TOP
hyprctl dispatch moveworkspacetomonitor 9 $DUO_BOTTOM
hyprctl dispatch moveworkspacetomonitor 10 $DUO_BOTTOM

hyprctl dispatch workspace 9
hyprctl dispatch workspace 6
hyprctl dispatch workspace 1
