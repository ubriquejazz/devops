#!/bin/bash

# altura de 3 personas en centímetros
clear
read -n 3 -p "Altura entre 100 y 999 (cm) : " ALTURA1 
echo
read -n 3 -p "Altura entre 100 y 999 (cm) : " ALTURA2
echo
read -n 3 -p "Altura entre 100 y 999 (cm) : " ALTURA3
echo
MAXIMA=$ALTURA1

# nos dice por pantalla la mayor de esas alturas.
if [ $ALTURA1 -gt $ALTURA2 ]; then
    if [ $ALTURA1 -gt $ALTURA3 ]; then
        MAXIMA=$ALTURA1
    else
        MAXIMA=$ALTURA3
    fi
else
    if [ $ALTURA2 -gt $ALTURA3 ]; then
        MAXIMA=$ALTURA2
    else
        MAXIMA=$ALTURA3
    fi
fi

echo Altura maxima $MAXIMA cm