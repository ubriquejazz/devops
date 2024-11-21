#!/bin/bash

clear
read -n 2 -p "Dime tu edad : " edad 
echo

# Suponemos que todo el mundo tiene más de 15 años y nadie tiene más de 60
if [ $edad -gt 60 ] || [ $edad -lt 15 ]
then
    exit 0
fi 
offset=$( date +%Y ) 
let nacimiento=offset-edad
echo Nacistes en $nacimiento
if [ $nacimiento -ge 1990 ] && [ $nacimiento -lt 2000 ] 
then
    echo Decada de los noventa
fi

if [ $nacimiento -ge 1980 ] && [ $nacimiento -lt 1990 ] 
then
    echo Decada de los ochenta
fi

if [ $nacimiento -ge 1970 ] && [ $nacimiento -lt 1980 ] 
then
    echo Decada de los setenta
fi