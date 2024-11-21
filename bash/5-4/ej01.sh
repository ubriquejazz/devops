#!/bin/bash

DiaSemana=$( date +%A )
DiaEnMes=$( date +%d )

echo "Hoy es $DiaSemana $DiaEnMes"
if [ $DiaEnMes -lt 15 ]
then
    echo "Primera quincena del mes"
else
    echo "Segunda quincena del mes"
fi

if [ $DiaSemana = "Friday" ]
then
    echo "Bravo! Por fin es viernes"
fi
