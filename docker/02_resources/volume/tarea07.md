# VOLÚMENES

Iniciamos aqui el tema de la persistencia de datos:

1. Crear los siguientes volúmenes con la orden docker volume: volumen_datos y volumen_web
2. Una vez creados estos contenedores:
    - Arrancar un contenedor llamado c1 sobre la imagen php:7.4-apache que monte el volumen_web en la ruta ***/var/www/html***
    - Arrancar un contenedor llamado c2 sobre la imagen mariadb que monte el volumen_datos en la ruta ***/var/lib/mysql*** y cuya contraseña de root sea admin.
3. Parar y borrar el contenedor c2 y tras ello borrar el volumen volumen_datos.

## Volumenes

    docker volume prune
    docker volume create web_vol
    docker volume create data_vol

## Contenedor de base datos con volumen data_vol

    docker run --name bd1 
    --mount type=volume,src=data_vol,dst=/var/lib/mysql 
    -e MYSQL_ROOT_PASSWORD=root
    -e MYSQL_DATABASE=test
    -p 3336:3306 mariadb

## Otro contenedor que usa el mismo volumen

    docker run --name bd2
    --mount type=volume,src=data_vol,dst=/var/lib/mysql 
    -p 3336:3306 mariadb

Comprobamos que tenemos las mismas tablas y usuarios:

    mycli -u root -P 3336
    docker ps -a

## Contenedor del servicio web usando bind mount

    docker run -d --name web1 
    -v $(pwd)/kinder:/usr/local/apache2/htdocs
    -p 8080:80 httpd    

Ahora seria buen momento de usar la extension de VS Code para navegar por el fs del contenedor (attached) hasta localizar la carpeta htdocs. Tras crear un fichero y probar que se renderiza podemos apagar el contenedor y ver la persistencia de dicho ficher en el equipo anfitrion.
