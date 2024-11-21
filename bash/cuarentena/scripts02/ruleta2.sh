#!/bin/bash
 
function ayuda () { 
  echo $0 value
  echo Script que simula una partida de ruleta europea.. numero={0..36}
  echo Además nos debe decir si el color que ha salido es rojo o negro. 
  echo El 0 es un número especial que no es ni rojo ni negro y gana la banca
}

function revela () { 
    if [ $2 -eq 0 ]; then
      echo $1 negro
    else
      echo $1 rojo
    fi
}

for (( ;; )); do
  let numero=RANDOM%37
  let color=RANDOM%2
  if [ $numero -eq 0 ]; then
    echo Gana la banca, te jodes
  else
    revela $numero $color
  fi

done