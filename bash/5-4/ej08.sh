#!/bin/bash

clear
for NUM in $( seq 3 ) # 1 2 3 4 5 6 7 8 9 10
do
    echo "NUM vale $NUM en esta iteracion"
done

SUMA=0
for NUM in $( seq 1 100 ); do
    let SUMA=SUMA+NUM
done
echo "Los numeros del 1 al 100 suman $SUMA"

for ((NUM=2; NUM<=40; NUM=NUM+2))
#for NUM in {2..40}
do
    echo "NUM vale $NUM en esta iteracion"
done
