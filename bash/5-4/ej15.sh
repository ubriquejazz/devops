#!/bin/bash

function mayor_edad {
    if [ $1 -ge 18 ]; then 
        echo Si, es mayor de edad
    else 
        echo No, es menor de edad
    fi 
} 

read -p "Dime la edad del que quiere entrar : " EDAD 
mayor_edad $EDAD