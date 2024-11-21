#!/bin/bash

clear
# script para mostrar los días de la semana por pantalla 
for dia in lunes martes miercoles jueves viernes
do
    echo $dia
done

for line in $( cat nombres.txt)
do
    echo $line
done