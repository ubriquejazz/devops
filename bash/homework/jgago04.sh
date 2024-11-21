#!/bin/bash

clear
N=$(ls *.sh | wc -l) 
echo "Encontrados $N scripts"

# script que los imprima si no hay más de 10 ficheros.
if [ $N -lt 10 ]; then
    for FILE in $( ls *.sh ); do
        echo $FILE
    done
fi