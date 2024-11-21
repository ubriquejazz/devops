#!/bin/bash
 
function ayuda () { 
  echo $0 value
}

read -p "Introduce una matricula (9999 ZZZ): " matricula

# longitud
if [ ${#matricula} -ne 8 ]; then
    echo No tiene 8 caracteres
fi

# parte digitos
for (( i=1; i<5; i=i+1 )); do 
  c=$(echo $matricula | cut -c $i)
  if [ $(echo 0123456789 | grep -i $c) ]; then
    echo $c correcto
  else
    echo $c no es un numero, posicion $i
  fi
done

# divisor
if [ $(echo $matricula | cut -c 5) <> ' ' ]; then
  echo $(echo $matricula | cut -c 5) no es el divisor intermedio
else
  echo divisor correcto
fi

# parte letras
for (( i=6; i<9; i=i+1 )); do 
  c=$(echo $matricula | cut -c $i)
  if [ $(echo ABCDEFGHIJKLMNOPQRSTUVWXYZ | grep -i $c) ]; then
    echo $c correcto
  else
    echo $c no es una letra, posicion $i
  fi
done