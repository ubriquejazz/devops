# Dockerfiles

1. Partiendo de la imagen php:7.4-apache construir un Dockerfile que realice lo siguiente:
    - Instalar git (apt install -y git)
    - Colocar en el directorio raíz del servidor apache (/var/www/html) un clone del repositorio oficial de WordPress
    - Le damos los permisos www-data
    - Instalamos el modulo mysqli

2. Una vez creado dicho Dockerfile construir la imagen, que se deberá llamar ...

## Creamos la imagen y un contenedor

    docker build -t ubriquejazz/miwp .
    docker run -d --name wp -p 8787:80 ubriquejazz/miwp 