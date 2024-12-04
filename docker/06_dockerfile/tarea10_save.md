# Dockerhub

1. Arrancar un contenedor sobre la imagen ubuntu:20.04 y sobre él realizar las siguientes operaciones:

    - Instalación del editor nano y vim 
    - Instalación de las herramientas de red 
    - Creación del usuario usuario con contraseña usuario (adduser usuario)

2. Tras realizar dichas instalaciones y utilizando la orden docker commit crear una imagen que se llame de la siguiente manera: TuNombreUsuarioDockerHub/a61 y subirla a DockerHub utilizanzo la orden docker push. Recordad que antes tendréis que hacer docker login.

## Primera version de la imagen

Arranco el contenedor

    docker run -it --name ejemplo ubuntu:20.04
    # apt-get update
    # apt-get install -y nano vim
    # adduser usuario
    
Creamos una imagen

    docker commit -a "Juan Gago" -m "Editores instalado" ejemplo ubriquejazz/ubu20mejorado:1.0
    
## Segunda version

    docker run -it ubriquejazz/ubu20mejorado:2.0
    # nano
    # apt-get update
    # apt install inetutils-tools
    # apt install nmap net-tools dnsutils

Creamos una imagen

    docker commit -a "Juan Gago" -m "Herramientas de red" ejemplo ubriquejazz/ubu20mejorado

## Distribucion con tar-ball

    docker save ubriquejazz/ubu20mejorado ubu20mejorado.tar

    docker load ubu20mejorado.tar

## Distribucion con DockerHub

    docker login 
    > ubriquejazz
    >
    
    docker push -a ubriquejazz/ubu20mejorado
    docker pull ubriquejazz/ubu20mejorado

More info [aqui](https://www.youtube.com/watch?v=eWkqN9U5yJU&list=PL-8CyWabyNa85xowmOeBMCspbrn6qNWgl&index=14)

**Importante**: Para que la imagen se pueda subir hay que activar el grupo docker 

    sudo usermod -aG docker $USER
    newgrp docker