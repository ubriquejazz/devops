#!/bin/bash

# script nos dirá cuantas vocales y cuantas consonantes

read -p "Introduce palabra: " nombre
vowel_cnt=0
const_cnt=0
let max=1+${#nombre}
for (( i=1; i<$max; i=i+1 )); do 
    c=$(echo $nombre | cut -c $i)
    if [ $(echo aeiou | grep -i $c) ]; then
        let vowel_cnt=vowel_cnt+1
        echo $c : vocal
    else
        let const_cnt=const_cnt+1
        echo $c : consonante
    fi
done
echo $vowel_cnt vocales
echo $const_cnt consonantes