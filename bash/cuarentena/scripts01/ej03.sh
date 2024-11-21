#!/bin/bash

read -p "Extensión de fichero: " EXT
CONT=0
for FILE in $( ls -R *.$EXT ); do
    echo $FILE
    let CONT=CONT+1
done
echo $CONT ficheros que hay en el directorio actual y subdirectorios
