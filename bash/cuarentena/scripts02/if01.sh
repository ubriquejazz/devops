#!/bin/bash

read -p "Introduce palabra de 8 caracteres: " nombre
if [ ${#nombre} -ne 8 ]; then
    echo Eso son ${#nombre}, te he dicho ocho, cohones!
fi