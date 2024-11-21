#!/bin/bash

clear
read -n 4 -p "anyo en que nacistes (4 cifras) : " anyo 
echo
let resto=anyo%12
echo Animal según el horóscopo chino para $anyo
case $resto in
    1|2|3|4|5)  echo El mono;;
    6|7|8|9|10) echo La serpiente;;
    *) echo La cabra;;
esac