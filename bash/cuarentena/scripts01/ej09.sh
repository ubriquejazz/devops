#!/bin/bash

# script que escogerá al azar entre piedra, papel y tijera
let MAGIC=RANDOM%3
opcion[0]=piedra
opcion[1]=papel
opcion[2]=tijera
echo La solucion es ${opcion[$MAGIC]}