# BIND MOUNTS

Seguimos con el tema de la persistencia de datos:

1. Crea una carpeta llamada saludo y dentro de ella crea un fichero llamado index.html con el siguiente contenido:
&lt;h1>HOLA SOY XXXXXX&lt;/h1>. Deberás sustituir ese XXXXX por tu nombre.
2. Una vez hecho esto arrancar dos contenedores basados en la imagen php:7.4-apache que hagan un **bind mount** de la carpeta saludo en la carpeta /var/www/html del contenedor.
3. Uno de ellos deberá redireccionar su puerto 80 al 8181 y el otro al 8282. Y su nombres serán c1 y c2.

## Creamos la carpeta

    mkdir saludo
    cd saludo
    echo "<h1>HOLA SOY YO</h1>" > index.html

## Contenedores basados en Apache

    docker run -d -name web1 -p 8787:80 -v $(pwd)/wen:/usr/local/apache2/httpdocs httpd

En VS Code podemos atacharnos al container y crear un nuevo fichero llamado prueba.html

http://localhost:8787/prueba.html

Si matamas al contenedor podemos arrancar otro que mapee la misma carpeta:

    docker run -d -name web2 -p 9797:80 -v $(pwd)/wen:/usr/local/apache2/httpdocs httpd

Ahora podemos acceder a prueba.html desde el nuevo contenedor:

http://localhost:9797/prueba.html

## Conclusion

Desde VS Code podemos acceder al filesystem de un contenedor. Necesitamos permisos de root para acceder a las carpetas mapeadas con volumenes. 

En cambio, si estan mapeadas con **bind-mounts** no tienes este problema. Prodriamos trabajar en DWES con esta solucion (ventajas respecto a XAMPP).

Mas informacion [aqui](https://www.youtube.com/watch?v=rV9mEsPQJW0&list=PL-8CyWabyNa85xowmOeBMCspbrn6qNWgl&index=12)
