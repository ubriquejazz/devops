#!/bin/bash

function doble {
    echo "voy a doblar el valor de numero"
    let NUMERO=NUMERO*2 
} 

function saludo {
    local NOMBRE="Jose Antonio"
    echo "Hola señor $NOMBRE encantado de conocerle"
} 

NUMERO=3 
echo "NUMERO vale : " $NUMERO 
doble
echo "NUMERO vale : " $NUMERO

NOMBRE="Juana"
saludo 
echo "En el script principal, mi nombre es $NOMBRE"
