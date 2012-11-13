# Determine if there are two monitors.
CONNECTED=$( xrandr | grep -w connected -c )
if [ $CONNECTED -eq 2 ]; then
  xrandr --output LVDS1 --auto --left-of VGA1 --auto
fi

sh ~/.fehbg &
xrdb -merge ~/.Xresources

# ~/bin/status_monitor.sh &

# put cpugraph?
# ~/bin/cpugraph.sh &
# conky | dzen2 -w 482 -h 18 -p -ta r -x 776 -y 1366 -bg "#101010" -fn "Terminus-8" &
# conky -c $HOME/.conkyrctop | dzen2 -w 683 -h 18 -x 683 -p -ta r -bg "#101010" -fn "Terminus-8" &
# $HOME/bin/mpd-controls.sh &
# trayer --edge bottom --align left --distancefrom left --distance 1256 --SetDockType true --SetPartialStrut true --expand true --width 4 --height 18 --transparent true --alpha 0 --tint 0x101010 &

xsetroot -cursor_name left_ptr
xset -b

urxvtd -q -o -f
# xscreensaver -no-splash &
# $HOME/.dropbox-dist/dropboxd &

# wbdrawer &
# exec startfluxbox
# exec ck-launch-session startxfce4
# exec xmonad
exec i3
# exec ck-launch-session /usr/bin/jwm
# exec openbox-session
# vim: ft=sh
