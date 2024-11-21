#!/bin/bash

#creará un fichero que se llame juego.sh (.sh lo incorpora) que como primera línea tenga un shebang
#comprueba que no existe ya un fichero con ese nombre (juego.sh) y si existe debe avisar y no crear nada. 
#también hará ejecutable el nuevo fichero que se crea

read -p "Nuevo script: " NAME
FILE=$NAME.sh

if [ -f $FILE ]; then
    echo No se puede crear $FILE
else
    echo "#!/bin/bash" > $FILE
    echo " " >> $FILE
    echo "function ayuda () { " >> $FILE
    echo "  echo \$0 value" >> $FILE
    echo "}"  >> $FILE
    chmod u+x $FILE
    echo Creado $FILE
fi