#!/bin/bash

Crear un script con nombre crear.sh que admita dos parámetros, 
el primero indicará el nombre de un fichero, y el segundo su tamaño. 
El script creará en el directorio actual un fichero con el nombre dado 
y el tamaño dado en Kilobytes. En caso de que no se le pase el segundo 
parámetro, creará un fichero con 1.024 Kilobytes y el nombre dado. 
En caso de que no se le pase ningún parámetro, creará un fichero con nombre 
fichero_vacio y un tamaño de 1.024 Kilobytes.

Ejemplo:

    crear.sh aguado 546     (546 K de tamaño)
    crear.sh panadero       (creará el fichero panadero con 1.024 K de tamaño).
    crear.sh                (creará el fichero fichero_vacio con 1.024 K de tamaño).