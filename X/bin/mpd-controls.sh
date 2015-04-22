#!/bin/sh

while true; do
  POS=`mpc | sed -ne 's/^.*(\([0-9]*\)%).*$/\1/p'`
  echo -n " ^fg(#505050)[ ^ca(1,mpc prev)^fg(#b7e234)^i(/home/arnold/.dzen/xbm8x8/prev.xbm)^ca() ^ca(1,mpc toggle)^i(/home/arnold/.dzen/xbm8x8/play.xbm)^ca() ^ca(1,mpc pause)^i(/home/arnold/.dzen/xbm8x8/pause.xbm)^ca() ^ca(1,mpc stop)^i(/home/arnold/.dzen/xbm8x8/stop.xbm)^ca() ^ca(1,mpc next)^i(/home/arnold/.dzen/xbm8x8/next.xbm)^ca() ^fg(#a0a0a0)$POS% ^fg(#505050)]"
  echo -n " ^fg(#b7e234)^i(/home/arnold/.dzen/xbm8x8/phones.xbm) ^fg(#a0a0a0)"
  echo "`mpc | sed -n '1p'`"
  sleep 1;
done | dzen2 -p -w 683 -h 18 -ta l -bg "#101010" -fg "#a0a0a0" -fn "Terminus-8"
