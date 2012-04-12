sh ~/.fehbg &

# ~/bin/status_monitor.sh &

# put cpugraph?
# ~/bin/cpugraph.sh &
conky | dzen2 -w 482 -h 18 -p -ta r -x 776 -y 1366 -bg "#101010" -fn "Terminus-8" &
trayer --edge bottom --align right --SetDockType true --SetPartialStrut true --expand true --width 8 --height 18 --transparent true --alpha 0 --tint 0x101010 &
conky -c $HOME/.conkyrctop | dzen2 -w 683 -h 18 -x 683 -p -ta r -bg "#101010" -fn "Terminus-8" &
$HOME/bin/mpd-controls.sh &

xsetroot -cursor_name left_ptr
xset -b

urxvtd -q -o -f
# $HOME/.dropbox-dist/dropboxd &

# wbdrawer &
# exec startfluxbox
# exec ck-launch-session startxfce4
exec xmonad
# exec ck-launch-session /usr/bin/jwm
# exec openbox-session
