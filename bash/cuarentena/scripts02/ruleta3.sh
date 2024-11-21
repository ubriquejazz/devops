#!/bin/bash
 
function ayuda () { 
  echo $0 value
  echo Script que simula una partida de ruleta europea.. numero={0..36}
  echo Apostemos a un color y también nos pedirá que le digamos cuanto dinero
}

function revela () { 
    if [ $2 -eq 0 ]; then
      echo $1 negro
    else
      echo $1 rojo
    fi
}

function comprueba () { 
    if [ $1 -eq $2 ]; then
      echo Has ganado $((2*$3)) euros!!
    else
      echo Has perdido $3 euros
    fi
}

select RESP in rojo negro salir; do
  opcion=0
  case $RESP in
    rojo) echo Has elegido rojo; let opcion=1;;
    negro) echo Has elegido negro; let opcion=0;;
    salir) break
  esac
  let numero=RANDOM%37
  let color=RANDOM%2

  read -p "Cuanto dinero (de 1 a 99 euros): " dinero
  if [ $numero -eq 0 ]; then
    echo Gana la banca, te jodes
  else
    revela $numero $color 
    comprueba $color $opcion $dinero
  fi
done

