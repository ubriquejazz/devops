#!/bin/bash

# script que nos permita jugar una partida al piedra papel tijera. 
let MAGIC=RANDOM%3
opcion[0]=piedra
opcion[1]=papel
opcion[2]=tijera
#echo La solucion es ${opcion[$MAGIC]}

select RESP in piedra papel tijera salir; do
    case $RESP in 
        piedra) MINUMERO=1;;
        papel) MINUMERO=2;;
        tijera) MINUMERO=3;;
        salir) break 
    esac
    let MINUMERO=MINUMERO-1
    if [ $MAGIC -eq $MINUMERO ]; then
        echo Has ganado!!
    else
        echo Vuelve a intentarlo
    fi
done


