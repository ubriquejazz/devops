#!/bin/bash

NUMERO=4    # ningún espacio en la asignación. 
echo "sin nada" $NUMERO+3
echo "doble parentesis" $(($NUMERO+3)) 
echo "con corchetes" $[$NUMERO+3] 

let SUMA=NUMERO+3 
echo "con comando let $SUMA"

#echo $(pwd)
echo `pwd`