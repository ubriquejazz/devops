#!/bin/bash
 
function ayuda () { 
  echo $0 value
  # El script nos pedirá que le digamos el nombre de un animal, 
  # lo añadirá al fichero animales.txt. Si el animal que le decimos resulta que ya 
  # esta introducido en el fichero animales.txt dirá por pantalla que el animal ya 
  # esta guardado y no hará nada. Este script debe poder ejecutarse múltiples veces
  # No debemos distinguir mayúsculas de minúsculas, así que leon, Leon y LEON
}

read -p "Animal: " animal
if [ $(cat animales.txt | grep $animal) ]; then
  echo Ya esta guardado
else
  echo $animal >> animales.txt
fi