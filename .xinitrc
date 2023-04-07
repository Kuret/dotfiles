#!/bin/sh

# Keyring
eval $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# DBus
eval $(dbus-launch --exit-with-session --sh-syntax)
dbus-update-activation-environment--verbose --all

# Scaling
xrdb -merge ~/.Xresources
xrandr --dpi 120
export QT_SCALE_FACTOR=1.25

# Sleep and locking
xset dpms 900 900 900
xset s 540 60
xss-lock -n "notify-send -i dialog-password 'Lockscreen' 'Locking in 60 seconds'" -l slock &

# Input
setxkbmap -layout us
xinput set-prop 17 283 1 # Natural scrolling magic trackpad

# Background and cursor style
xsetroot -solid "#282828"
xsetroot -cursor_name left_ptr

# Startup services
xbanish &
dunst &
pulseaudio --daemonize=no --exit-idle-time=-1 &
~/bin/statusline &

# Run WM
exec dwm

# exec dwm & wmpid=$!
# ~/bin/statusline &
# wait $wmpid
