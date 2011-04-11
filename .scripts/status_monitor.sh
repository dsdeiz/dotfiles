#!/bin/bash

GFG='#aecf96'
GBG='#333'
URG_COL='#ff4747'

LOWBAT=25

BAT_PATH="/sys/class/power_supply/BAT0"
BAT_FULL=$( cat $BAT_PATH/energy_full )
BAT_NOW=$( cat $BAT_PATH/energy_now )
BAT_PREBAR='^i(/home/arnold/.dzen/xbm8x8/bat_full_02.xbm)'

let perc=(100*$BAT_NOW)/$BAT_FULL

HIGHMEM=90

MEM_PATH='/proc/meminfo'
MEM_TOTAL=$( cat $MEM_PATH | grep -i memtotal | awk '{print $2}' )
MEM_FREE=$( cat $MEM_PATH | grep -i memfree | awk '{print $2}' )
MEM_CACHED=$( cat $MEM_PATH | grep -i -m 1 cached | awk '{print $2}' )
MEM_USED=$(( $MEM_TOTAL-($MEM_FREE+$MEM_CACHED) ))
MEM_PERC=$(( ($MEM_USED*100)/$MEM_TOTAL ))
MEM_PREBAR='^i(/home/arnold/.dzen/xbm8x8/mem.xbm)'

while :; do

if [ $perc -le $LOWBAT ]; then GFG=$URG_COL; fi
BAT_METER=$( echo $perc | gdbar -h 10 -w 80 -fg $GFG -bg $GBG -ss 1 -s o )

if [ $MEM_PERC -gt $HIGHMEM ]; then GFG=$URG_COL; fi
MEM_METER=$( echo $MEM_PERC | gdbar -h 10 -w 80 -fg $GFG -bg $GBG -ss 1 -s o )

DATE=$( date +"%a, %b %_d %l:%M %p" )

echo "$MEM_PREBAR $MEM_PERC% $MEM_METER $BAT_PREBAR $perc% $BAT_METER    $DATE"

sleep 10
done | dzen2 -h 14 -w 400 -p -ta r -x 966 -fg '#a0a0a0' -bg black -fn "Terminus-9"
