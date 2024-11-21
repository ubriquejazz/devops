#!/bin/bash

PWD="Null"
until [ $PWD = "Password" ]; do
    read -p "Cual es la password: " PWD
done
echo Puede ud. entrar, campeon!