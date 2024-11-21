#!/bin/bash

# script que nos pide un codigo postal
clear
read -n 5 -p "Introduzca un codigo postal: " CP
echo

case $CP in
    11600)  echo Ubrique;;
    11612)  echo Benaocaz;;
    110*)   echo Cadiz capital;;
    112*)   echo Algeciras;;
    114*)   echo Jerez;;
    1110*)  echo San Fernando;;
    1111*)  echo San Fernando;;
    1112*)  echo Campo Soto;;
    *)      echo Ese codigo no esta contemplado;;
esac