#!/bin/bash

function ayuda(){
    echo "Script que recibe como argumento una dirección IP de red y comprueba si hay direcciones activas entre 1 y 254"
    echo "Sintaxis:"
    echo "$0 <dirección IP.>"
}

# Comprobación del número de argumentos
if [[ $# -ne 1 ]]
then
	echo "Número de argumentos incorrecto"
	ayuda
	exit 1				# Salida con codigo de salida 1 (error)
fi

teclaIP=$1	# Capturamos en la variable teclaIP el argumento recibido
prefijoIP=${teclaIP%.*}. # eliminamos desde el último punto en adelante
fichero="log/network_${prefijoIP}0.txt"
for ((offset=100;offset<200;offset+=10))
do
	for ((i=offset;i<offset+10;i++))
	do
		ping  -c 1 -W 1  ${prefijoIP}${i} >/dev/null && echo "${prefijoIP}${i}" | tee -a ${fichero} || echo "IP ${prefijoIP}${i} NO está activa" 
	done
done
exit 0