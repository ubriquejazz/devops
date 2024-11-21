#!/bin/bash

# set field delimiter to '\n'
IFS=$'\n'
for elemento in $( cat nombres.txt ); do
    echo "Elemento vale: " $elemento
done