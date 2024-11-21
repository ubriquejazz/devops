#!/bin/bash

read -p "Dime un número al azar entre 1 y 100: " NUM
read -p "Cual es el triple? " INTENTO
let REALIDAD=NUM*3
if [ $INTENTO -eq $REALIDAD ]; then
    echo Mis mas sinceras congratulaciones
else
    echo El triple de $NUM no es $INTENTO sino $REALIDAD
    echo No tienes ni puta idea, maricon!
fi