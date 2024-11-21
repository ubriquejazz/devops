#!/bin/bash

Tenemos un directorio que contiene, entre otras cosas, scripts de shell. 
Se desea modificarlos, insertando entre su primera y segunda línea el copyright 
del autor, la fecha y el nombre del fichero
El script se usará de la siguiente forma:

pon_cabecera.sh /home/usuario/scripts /home/usuario/licencia.txt 

El primer parámetro indica el directorio donde están los scripts con extensión .sh. 
El segundo es el fichero con el mensaje de copyright (c) (una única línea).
