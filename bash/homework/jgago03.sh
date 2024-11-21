#!/bin/bash

clear
read -n 2 -p "Dime mes : " Mes 
echo
if [ $Mes -gt 12 ]
then
    exit 0
fi 
# a partir de un mes (enero, febrero, etc.) indica el número de días que tiene ese mes.
# se considera que no existen los años bisiestos, así que febrero siempre tendrá 28 días.
let DiasEnMes=31
case $Mes in
    2)          let DiasEnMes=28;;
    4|6|9|11)   let DiasEnMes=30;;
    *)          ;;
esac
echo El mes $Mes tiene $DiasEnMes dias