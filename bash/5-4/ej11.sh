#!/bin/bash

clear
conjunto=$( find ~ -iname "*.mp3" )
select MP3 in $conjunto "Salir"; do
    if [ $MP3 = "Salir" ]; then
        break
    fi 
    aplay $MP3 > /dev/null
done
