#!/bin/bash

# Copia /etc/network/interfaces en el directorio actual con el nombre red140218.conf 
NOMBRE_FICHERO="red"$(date +%d%m%y)".conf"
cp /etc/network/interfaces $NOMBRE_FICHERO

NUMERO_SCRIPTS=$(find . -iname "*.sh" | wc -l)
echo "Tenemos $NUMERO_SCRIPTS scripts en el directorio actual"

echo esto es un dólar y tres letras $ABC sin comillas               # nada
echo "esto es un dólar y tres letras $ABC entre comillas dobles"    # espacio
echo 'esto es un dólar y tres letras $ABC entre comillas simples'   # $ABC