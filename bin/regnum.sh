#!/bin/bash

# Simple fort/gem status script.
# Uncomment line 6 and comment line 7 if you prefer wget instead of curl. ~ Heat

wget -q "http://regnumonlinegame.com/ranking/index.php?l=1&opt=1&realm=0&world=horus" -O /tmp/regnumforts
#curl -so /tmp/regnumforts "http://regnumonlinegame.com/ranking/index.php?l=1&opt=1&realm=0&world=horus"

for i in 268 282 296 318 332 346 368 382 396
do
    line=`sed -n "${i}p" /tmp/regnumforts`
    case $i in
        268) fort=Imperia;;
        282) fort=Aggersborg;;
        296) fort=Trelle;;
        318) fort=Shaanarid;;
        332) fort=Menirah;;
        346) fort=Samal;;
        368) fort=Eferias;;
        382) fort=Algaros;;
        396) fort=Herbred;; 
    esac   

    if [[ `echo $line | grep --count "syrtis"` > 0 ]] ; then
        echo -e "\e[1;32m$fort\e[0m"
    fi
    if [[ `echo $line | grep --count "ignis"` > 0 ]] ; then
        echo -e "\e[1;31m$fort\e[0m"
    fi
    if [[ `echo $line | grep --count "alsius"` > 0 ]] ; then
        echo -e "\e[1;34m$fort\e[0m"
    fi
done

for i in 310 360 410
do
    gems=`sed -n "${i}p" /tmp/regnumforts | awk -F "_gem" '{print NF-1}'`
    while [[ $gems -gt 0 ]]
    do
        case $i in
            310) echo -en "\e[1;34m#\e[0m";;
            360) echo -en "\e[1;31m#\e[0m";;
            410) echo -en "\e[1;32m#\e[0m";;
        esac
        gems=`expr $gems - 1`
    done
done
echo

