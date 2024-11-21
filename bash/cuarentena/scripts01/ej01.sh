#!/bin/bash

# script que nos muestre el número de usuarios totales 
CONT=0
for USR in $( ls /home/ ); do
    echo Usuario $USR
    let CONT=CONT+1
done
echo $CONT usuarios en el sistema