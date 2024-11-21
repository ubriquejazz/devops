#!/bin/bash
clear 
read -p "Introduzca un número : " NUMERO 

# script que indica si es par o impar. 
let RESTO=NUMERO%2 
if [ $RESTO -eq 0 ]; then
    echo El número $NUMERO es par
else
    echo El número $NUMERO es impar
fi

# indica si es multiplo de 10
let RESTO=NUMERO%10
if [ $RESTO -eq 0 ]; then
    echo El número $NUMERO es multiplo
else
    echo El número $NUMERO no es multiplo
fi
