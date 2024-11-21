#!/bin/bash
 
function ayuda () { 
  echo $0 value
  echo Script que simula una partida de ruleta europea.. numero={0..36}
}

for (( ;; )); do
  let numero=RANDOM%37
  if [ $numero -eq 0 ]; then
    echo Gana la banca, te jodes!
  else
    echo $numero
  fi
done