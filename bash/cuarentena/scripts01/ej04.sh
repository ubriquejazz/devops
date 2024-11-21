#!/bin/bash

# script que nos pregunte por pantalla dos números 
# y nos diga cuanto es su suma y cuanto es su multiplicación.

read -p "Operando 1: " Op1
read -p "Operando 2: " Op2
read -p "Operando 3: " Op3

let Suma=Op1+Op2+Op3
echo La suma de los tres es $Suma
echo El producto de $Op1 por $Op2 es $(( $Op1 * $Op2 ))
