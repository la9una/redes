Las imagenes Docker son plantillas, una suerte de instantánea o fotografía del estado de un contenedor y que puede ser empleada para crear otros contenedores. Las imágenes están formadas por diferentes "capas", incluyendo una aplicación, los binarios y las librerias necesarias. 

## IMÁGENES (DOCKER HUB)
Docker posee un repositorio público de imágenes "prefabricadas", creadas por empresas o particulares. Las mimas pueden encontrarse en [Docker Hub](https://hub.docker.com/).

Las instrucciones que siguen aplican a la gestión de imágenes Docker a través de la terminal de comandos. 

### Buscar imágenes
Podemos buscar imágenes usando el siguiente comando:

```bash
docker search <Términos de Búsqueda>
```

Por ejemplo: 

```bash
docker search python
```
La acción nos devolverá las imágenes disponibles que coinciden con el término de búsqueda "python"


### Descargar una imagen
Podemos descargar fácilmente una imagen desde el repositorio a nuestro equipo: 

```bash
docker pull <imageName>[:<tag>]
```

Por ejemplo: 

```bash
dockker pull python:latest
```
El comando de ejemplo descargará la última imagen de python en la amistad. 

Otro ejemplo: 


```bash
dockker pull debian:9.13
```

En este caso, se descargará a nuestro equipo la imagen de Debian, versión 9.13




### Ver imagenes descargadas
Ver las imágenes descargadas

```bash
docker images [-a] [-q]
```

### Borrar imágenes
Introduciendo el ID de imagen

```bash
docker rmi <imageID> [<imageID>] [<imageID>]
```


### Todas las imágenes 
Eliminando todas las imágenes descargadas

	docker rmi $(docker images -q)

O bien: 

	docker rmi $(docker images -q) -f

## IMÁGENES PROPIAS

### Dockerfile
Es un archivo de texto plano que contiene ciertas instrucciones mediante las cuáles crearemos nuestra imagen personalizada de Docker. Su sintaxis básica es la siguiente:

```dockerfile
# Comment
INSTRUCTION arguments
```

#### Algunas instrucciones de un Dockerfile
**`FROM <imagen>[:tag]`**
Establece la imagen de base con la que se construirá la imagen personalizada.

**`MAINTAINER <autor> <email>`**
Nos permite indicar el autor del Dockerfile

**`RUN <comandos>`**
Ejecuta comandos cuando se está construyendo una imagen personalizada.

**`CMD <comandos>`**
Pasa valores por defecto en la imagen para que se ejecuten cuando se lance un contenedor.

**`COPY <origen> <destino>`**
Copia archivos desde <origen> local hacia un <destino> en el contenedor

**`ADD <origen> <destino>`**
Copia archivos desde <origen> local ó remoto hacia un <destino> en el contenedor

**`ENV <clave=valor>`**
Inicializa variables de entorno (sistema), con el formato "clave=valor".

**`EXPOSE`**
Indica los puertos TCP/IP por los que se pueden acceder a los servicios del contenedor.

#### Ejemplos de Dockerfile
Ejemplo de contenido de un Dockerfile que creará una imagen partiendo de Centos e instalará un servidor web:

```dockerfile
FROM centos
RUN yum install httpd -y
CMD apachectl -DFOREGROUND
```

Ejemplo de contenido de un Dockerfile (un poco más complejo) que creará una imagen partiendo de Ubuntu e instalará un servidor web:


```dockerfile
FROM ubuntu
ENV TIMEZONE=America/Argentina/Buenos_Aires
RUN ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime \
	&& echo $TIMEZONE > /etc/timezone \
	&& apt-get update \ 
	&& apt-get upgrade -y \
	&& apt-get install apache2 -y \
	&& apt-get clean
EXPOSE 22 80
CMD ["apache2ctl", "-D", "FOREGROUND"]
```

### Generando imagen a partir del Dockerfile
Para generar una imagen a partir de un archivo Dockerfile, debemos situarnos donde éste y ejecutar el siguiente comando: 

```bash
docker build -t <ImageName[:tag]> .
```
Por ejemplo: 

```bash
docker build -t imagenpersonalizada .
```

En caso que tengamos más de un Dockerfile (no pueden llamarse de la misma manera) podemos invocar el nombre del archivo Dockerfile con la opción `-f`:

```bash
docker build -t <ImageName[:tag]> [-f <Nombre del Dockerfile>] .
```

Por ejemplo: 

```bash
docker build -t imagenpersonalizada . -f miDockerfile
```