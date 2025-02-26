#!/bin/bash 

# script que permite jugar a adivinar un número en varios 
# intentos y llevando un control de los 3 mejores.

clear # Si pasamos como parametro x borramos fichero record 
if [ $# -ne 0 ]; then # para controlar que se han pasado parámetros.
    if [ $1 = x ]; then
        echo "Borrando fichero de records." rm record.txt
    fi
fi 

# Ahora vamos a leer el fichero de records para imprimirlo. 
if [ -f record.txt ]; then
    POS=0 
    for CAMPEON in $(cat record.txt); do 
        let POS=POS+1 
        NOMBRE=$(echo $CAMPEON | cut -d: -f2) 
        NUMERO=$(echo $CAMPEON | cut -d: -f1)
        echo "En posición $POS esta $NOMBRE con $NUMERO intentos" 
    done
else
    echo "No hay ningún record todavía. Aprovecha la oportunidad" 
    echo '******************************************************'
fi 

CONTADOR=1 
let MINUMERO=RANDOM # $RANDOM nos da un número aleatorio.
# MINUMERO=3 # para hacer pruebas, descomentar esta línea y comentar la anterior.
echo ' ' ; echo ' ' 
echo '*****************************************************' 
read -p "Dime tu nombre : " NOMBRE 
echo ' ' ; echo ' ' 
read -p "Llevas $CONTADOR intentos. Dime un número: " NUMERO 

until [ $NUMERO -eq $MINUMERO ]; do 
    if [ $NUMERO -gt $MINUMERO ]; then
        echo "El número que has metido es mayor"
    else
        echo "El número que has metido es menor"
    fi 
    let CONTADOR=CONTADOR+1 
    read -p "Llevas $CONTADOR intentos. Dime un numero: " NUMERO
done  

# grabamos el record en el fichero (primero los intentos y luego el nombre) 
echo Hombreeee, por fin acertaste.
echo $CONTADOR:$NOMBRE >> record.txt 

# ordenamos para dejar arriba los que lo han hecho en menos intentos 
# y nos quedamos con las 3 primeras líneas 
sort record.txt -g | head -3 > recordtemp.txt 
cp recordtemp.txt record.txt
