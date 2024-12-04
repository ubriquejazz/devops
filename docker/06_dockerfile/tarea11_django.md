# Dockerfiles

1. Partiendo de la imagen python:3.8.7

2. Una vez creado dicho Dockerfile construir la imagen, que se deberá llamar ...

## Contenedor con aplicacion en [Django](https://www.youtube.com/watch?v=LJ1_hxw1c38&list=PL-8CyWabyNa85xowmOeBMCspbrn6qNWgl&index=6)

    cd djangoapp
    code .

La aplicacion se llama miapp con lo que al navegador le paso localhost:8000/miapp

    cd ..
    docker run -it --name django -v $(pwd)/djangoapp:/app -p 8000:8000 python:3.8.7

Esto arrancaria un interprete de python. Debemos salirnos y ejecutar un comando exec que nos de un terminal dentro del contenedor y asi poder instalar dependencias y correr el servidor:
   
    # pip install -r rquirementes.txt
    # python manage.py runserver 0.0.0.0:8000

##  Ahora con Dockerfile

La carpeta django contiene estos archivos:
- Aplicacion que dice "hola pepe" (djangoapp)
- Dockerfile y .dockerignore
- Script para lanzar el servidor con depuracion (entrypoint)

Ahora me meto y construyo la imagen:

    cd django
    docker build -t ubriquejazz/djangopepe .

Lanzo el contenedor:

    docker run -d -it --name pepe ubriquejazz/djangopepe


    