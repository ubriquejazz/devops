#!/bin/bash

read -p "Introduzca el personaje secreto: " PERSONAJE 
read -p "Maximo de pistas a introducir: " NUMPISTAS

for ((I=1; I<=$NUMPISTAS; I++ )); do
    read -p "Digamos una pista para el personaje: " PISTA 
    pistas[$I]=$PISTA
done

read -n 1 -p "Pulse una tecla para comenzar a jugar"
clear
echo "He pensado en un personaje, a ver con cuantas pistas lo adivinas"
for ((I=1; I<=$NUMPISTAS; I++ )); do
    echo "Pista numero " $I 
    echo ${pistas[$I]}
    read -p "Que personaje crees que es: " RESPUESTA 
    if [ $RESPUESTA = $PERSONAJE ]; then
        echo Muy bien, lo has acertado!
        break
    else
        if [ $I -lt $NUMPISTAS ]; then
            echo No, sigue intenandolo
        else
            echo Ohh, no lo has adivinado. Era $PERSONAJE 
        fi
    fi
done

