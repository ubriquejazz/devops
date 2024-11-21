#!/bin/bash

# script que nos dirá cuantas vocales existen en dicha palabra 

read -p "Introduce palabra: " nombre
cnt=0
let max=1+${#nombre}
for (( i=1; i<$max; i=i+1 )); do 
    c=$(echo $nombre | cut -c $i)
    if [ $(echo aeiou | grep -i $c) ]; then
        let cnt=cnt+1
        echo $c
    fi
done
echo $cnt vocales