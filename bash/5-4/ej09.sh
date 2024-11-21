#!/bin/bash

# script que pide números y muestra el doble de dichos números. 
# el script continua ejecutandose mientras que no se introduzca 0.

read -p "Dime un número (0 para salir) : " NUMERO 

while [ $NUMERO -ne 0 ]; do
    echo "El doble de $NUMERO es :" $[ $NUMERO*2 ]    
    # echo ... $(($NUMERO*2))
    read -p "Dime un número (0 para salir) : " NUMERO 
done

echo Adios!
