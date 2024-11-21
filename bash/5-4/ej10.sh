#!/bin/bash

select RESP in Chiste Refran Poema Salir; do
    case $RESP in
        Chiste)     echo "Soy muy indeciso... o no";;
        Refran)     echo "Cria cuervos y tendras muchos";;
        Poema)      echo "Mi corazon hace tolon";;
        Salir)      break
    esac
done