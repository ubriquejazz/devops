#!/bin/bash

read -p "Cuantos hijos tienes? " NUM_HIJOS
if [ $NUM_HIJOS -eq 1 ]; then
    echo "Hijo unico"
elif [ $NUM_HIJOS -eq 2 ]; then
    echo "La parejita"
elif [ $NUM_HIJOS -gt 2 ]; then
    echo "Familia numerosa"
else
    echo "No tines hijos"
fi
