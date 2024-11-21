#!/bin/bash

read -p "dime una vocal: " V 
if [ $( echo 'aeiou' | grep -i $V ) ]
then
    echo Muy bien, $V es una vocal
else
    echo $V no es una vocal
fi