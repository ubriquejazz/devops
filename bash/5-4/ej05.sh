#!/bin/bash

# script que nos pide un número de tres cifras e indica si es capicúa 
clear
read -n 3 -p "Número entre 100 y 999 (no pulses INTRO) : " NUMERO 
echo # este echo sirve para introducir un retorno de linea 

if [ $NUMERO -lt 100 ]; then
    echo "Lo siento, has introducido un número menor de 100" 
else
    PRIMERA_CIFRA=$(echo $NUMERO | cut -c 1)
    TERCERA_CIFRA=$(echo $NUMERO | cut -c 3)

    if [ $PRIMERA_CIFRA = $TERCERA_CIFRA ]; then 
        echo "El número $NUMERO es capicúa."
    else 
        echo "El número $NUMERO ni es capicúa ni ná".
    fi
fi
