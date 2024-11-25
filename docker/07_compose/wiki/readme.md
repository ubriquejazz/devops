# MediaWiki

Objetivo: Aprender a instalar y configurar MediaWiki en un entorno de desarrollo utilizando Docker Compose, basándose en una guía para Raspberry Pi y Docker.

## Preparar el entorno de trabajo:
Asegúrate de tener Docker y Docker Compose instalados en tu sistema.
Crea una carpeta de trabajo llamada mediawiki-docker:

    mkdir mediawiki-docker
    cd mediawiki-docker

## Crear el archivo docker-compose.yml:

Abre el archivo con tu editor de texto favorito y añade el siguiente contenido:

    version: '3.8'

    services:
      mediawiki:
        image: mediawiki:latest
        ports:
          - "8080:80"
        environment:
          - MEDIAWIKI_DB_HOST=db
          - MEDIAWIKI_DB_USER=wiki_user
          - MEDIAWIKI_DB_PASSWORD=wiki_password
          - MEDIAWIKI_DB_NAME=wiki_database
        volumes:
          - ./mediawiki:/var/www/html
        depends_on:
          - db

      db:
        image: mariadb:10.5
        environment:
          - MYSQL_ROOT_PASSWORD=root_password
          - MYSQL_DATABASE=wiki_database
          - MYSQL_USER=wiki_user
          - MYSQL_PASSWORD=wiki_password
        volumes:
          - ./db_data:/var/lib/mysql

    volumes:
      db_data:

## Configurar las carpetas necesarias:

Crea las carpetas para almacenar los datos persistentes:

    mkdir mediawiki
    mkdir db_data

## Configurar permisos (si es necesario):

Ajusta los permisos para que Docker pueda escribir en las carpetas:

    sudo chmod -R 777 mediawiki db_data

## Iniciar los servicios:

En la terminal, ejecuta:

    docker-compose up -d

Docker descargará las imágenes necesarias y levantará los contenedores de MediaWiki y MariaDB.

## Acceder a MediaWiki:

- Abre tu navegador y dirígete a http://localhost:8080.
- Sigue los pasos del instalador de MediaWiki:
- Introduce la información de la base de datos: <br>
    Servidor de base de datos: db<br>
    Nombre de base de datos: wiki_database<br>
    Usuario: wiki_user<br>
    Contraseña: wiki_password<br>
- Completa la configuración del sitio.

## Finalizar la configuración:

- Descarga el archivo LocalSettings.php generado al final de la instalación.
- Colócalo en la carpeta mediawiki:

        mv /ruta/del/archivo/LocalSettings.php ./mediawiki/

## Verificar el estado de los contenedores:

Comprueba que los contenedores están corriendo:

    docker-compose ps

## Tareas de evaluación:

- Crea una página de prueba en tu MediaWiki.
- Reinicia los contenedores y verifica que los datos persisten.
- Puedes personalizar el puerto 8080 si está en uso por otro servicio en tu máquina.

## References

- [Raspberry](https://peppe8o.com/personal-mediawiki-with-raspberry-pi-and-docker/)