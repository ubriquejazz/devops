# Laravel

Docker compose para compartir del comando:

    docker run --name debugPHP -p 9000:80 -v type=bind,src=$(pwd)/app,dst=/var/www/html php:7.4-apache

Ojo, en docker compose solo se usan volumenes. Lo llamaremos **php_data**

Tenemos un dockerfile para instalar un wordpress en la carpeta /var/www/html 

Para la base de datos podriamos usar el comando:

    docker run --name bd -e MYSQL_DATABASE=... mariadb

## References

- [Contenedor PHP con bind mount](https://www.youtube.com/watch?v=OBvVSUYDq5s&list=PL-8CyWabyNa85xowmOeBMCspbrn6qNWgl&index=7)

- [Ejemplos con dockerfile](https://www.youtube.com/watch?v=oiZORiVh3Gs&list=PL-8CyWabyNa85xowmOeBMCspbrn6qNWgl&index=15)