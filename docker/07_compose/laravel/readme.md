# Laravel

Docker compose equivalente al comando:

    docker run --name debugPHP -p 9000:80 -v type=bind,src=$(pwd)/app,dst=/var/www/html php:7.4-apache

Ojo, en docker compose solo se usan volumenes, no bind-mounts. Lo llamaremos **php_data**

De la tarea 11, tenemos un dockerfile para instalar un wordpress. Simplemente hacemos un git pull en la carpeta /var/www/html. Para la base de datos podriamos usar el comando:

    docker run --name bd -e MYSQL_DATABASE=... -p 3336:3306 mariadb

Para comprobar que el servidor de bases de datos esta corriendo:

    mycli -P 3336 -u pepe
    > pepe
    > show databases
## References

- [Contenedor PHP con bind mount](https://www.youtube.com/watch?v=OBvVSUYDq5s&list=PL-8CyWabyNa85xowmOeBMCspbrn6qNWgl&index=7)

- [Ejemplos con dockerfile](https://www.youtube.com/watch?v=oiZORiVh3Gs&list=PL-8CyWabyNa85xowmOeBMCspbrn6qNWgl&index=15)