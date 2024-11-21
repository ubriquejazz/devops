#!/bin/bash
NUMERO=0
until [ $NUMERO -eq 11 ]; do
    read -p "Cual es la raíz cuadrada de 121: " NUMERO
done
echo Enhorabuena, campeon!