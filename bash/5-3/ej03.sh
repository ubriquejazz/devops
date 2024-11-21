#!/bin/bash

# media aritmética de las tres notas introducidas
read -p "Introduce la nota de PAR: " NOTA_PAR
read -p "Introduce la nota de GBD: " NOTA_GBD
read -p "Introduce la nota de ISO: " NOTA_ISO

# suma=$[ $NOTA_GBD + $NOTA_ISO + $NOTA_PAR ]
# let suma=NOTA_GBD+NOTA_ISO+NOTA_PAR
suma=$(( $NOTA_GBD + $NOTA_ISO + $NOTA_PAR ))

# let media=suma/3 
# media=$[ $suma/3 ]
media=$( echo "scale=4; $suma/3" | bc -l )
echo "La media es $media"
