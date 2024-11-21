#!/bin/bash

AHORA=$( date +%HH )
AHORA=$(echo $AHORA | cut -c 2)

if [ $AHORA -lt 12 ] || [ $AHORA -lt 12 ]; then
    echo buenos días
fi
if [ $AHORA -lt 12 ] || [ $AHORA -lt 12 ]; then
    echo buenos tardes
fi
if [ $AHORA -lt 12 ] || [ $AHORA -lt 12 ]; then
    echo buenos noches
fi

