#!/bin/bash

# copiar a un llaverito USB (montado en /media/usbdisk) 
# todos los scripts que tengamos en el directorio home
if [ -d /media/usbdisk/scripts ]; then
    mkdir /media/usbdisk/scripts 
if

N=$( find ~ -iname "*.sh" 2> /dev/null | wc -l)
echo "Preparados para copiar $N scripts"

for programa in $( find ~ -iname "*.sh" 2> /dev/null ) 
do
    echo “copiando el script :” $programa
    cp $programa /media/usbdisk/scripts 
done

