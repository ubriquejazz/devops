# Dockerfiles

1. Partiendo de la imagen php:7.4-apache construir un Dockerfile que realice lo siguiente:
    - Instalar git (apt install -y git)
    - Colocar en el directorio raíz del servidor apache (/var/www/html) un clone del repositorio oficial de WordPress
    - Le damos los permisos www-data
    - Instalamos el modulo mysqli

2. Una vez creado dicho Dockerfile construir la imagen, que se deberá llamar ...

## Design

    # Partimos de la imagen base de PHP 7.4 con Apache
    FROM php:7.4-apache

    # Actualizamos el sistema e instalamos git
    RUN apt-get update && apt-get install -y git 

    # Instalamos la extensión mysqli
    RUN docker-php-ext-install mysqli

    # Clonamos el repositorio oficial de WordPress
    RUN git clone https://github.com/WordPress/WordPress.git /var/www/html

    # Cambiamos el propietario de los archivos al usuario y grupo de Apache
    RUN chown -R www-data:www-data /var/www/html

Notas
- Instalación de mysqli: Utilizamos el script integrado docker-php-ext-install para compilar e instalar la extensión mysqli.
- Clonar WordPress: Descargamos el repositorio oficial de WordPress y lo colocamos en directorio raíz del servidor Apache
- Permisos: Cambiamos el propietario de los archivos para que pertenezcan a www-data, el usuario bajo el cual corre Apache en la imagen.

## Creamos la imagen y la subo

    docker build -t ubriquejazz/wordpress-apache:latest .
    docker login
    docker push ubriquejazz/wordpress-apache:latest

## Ejecuto un contenedor (remoto)

    docker pull ubriquejazz/wordpress-apache:latest
    docker run -d --name wp -p 8787:80 ubriquejazz/wordpress-apache:latest  