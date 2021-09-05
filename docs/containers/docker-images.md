Las imagenes Docker son plantillas, una suerte de instantánea o fotografía del estado de un contenedor y que puede ser empleada para crear otros contenedores. Las imágenes están formadas por diferentes "capas", incluyendo una aplicación, los binarios y las librerias necesarias. 

## IMÁGENES (DOCKER HUB)
Docker posee un repositorio público de imágenes "prefabricadas", creadas por empresas o particulares. Las mimas pueden encontrarse en [Docker Hub](https://hub.docker.com/).

Las instrucciones que siguen aplican a la gestión de imágenes Docker a través de la terminal de comandos. 

### Buscar imágenes
Podemos buscar imágenes usando el siguiente comando:

```docker
docker search <Términos de Búsqueda>
```

Por ejemplo: 

```docker
docker search python
```
*La acción nos devolverá las imágenes disponibles que coinciden con el término de búsqueda "python"*


### Descargar una imagen
Podemos descargar fácilmente una imagen desde el repositorio a nuestro equipo: 

```docker
docker pull <imageName>[:<tag>]
```

Por ejemplo: 

```docker
dockker pull python:latest
```
*El comando de ejemplo descargará la última imagen de python diponible.* 

Otro ejemplo: 


```docker
dockker pull debian:9.13
```

*En este caso, se descargará a nuestro equipo la imagen de Debian, versión 9.13*




### Ver imagenes descargadas
Para visualizar las imágenes que ya hemos descargado a nuestro equipo, ejecutamos: 

```docker
docker images [-a] [-q]
```
Donde `-a` y `-q` son opcionales:

* `-a` Las imágenes están formadas por capas. La opción nos muestra todas las imágenes, inclusive aquellas intermedias. 
* `-q` Nos muestra sólo el ID de las imágenes.  

Si queremos listar sólo las imágenes "intermedias" o _dangling_ ejecutamos: 

```docker
docker images -f dangling=true
```


### Borrar imágenes
Para borrar una imagen descargada, simplemente debemos conocer el ID de la imagen y ejecutar el siguiente comando: 

```docker
docker rmi <imageID> 
```

Si en cambio queremos borrar todas las imágenes que hemos descargado, ejecutamos. 

```docker
docker rmi $(docker images -q)
```

O bien: 

```docker
docker rmi $(docker images -q) -f
```

Por último: 

```docker
docker images purge
```

!!!warning "Borrar imágenes en uso"
	Sólo se podrán borrar aquellas imágenes que no estén siendo utilizadas por ningún contenedor. 


## IMÁGENES PERSONALIZADAS
Nó sólo podemos emplear las imágenes descargadas de Docker Hub "así como están" sino que podemos personalizarlas según nuestras necesidades. 

### El archivo Dockerfile
Es un archivo de texto plano que contiene ciertas instrucciones mediante las cuáles crearemos nuestra imagen personalizada de Docker. Su sintaxis básica es la siguiente:

```dockerfile
# Comment
INSTRUCTION1 arguments
INSTRUCTION2 arguments
...
```

#### Algunas instrucciones de un Dockerfile
A continuación, listamos las instrucciones de Dockerfile más utilizadas

##### FROM
```docker
FROM <imagen>[:tag]
```
Establece la imagen de base con la que se construirá la imagen personalizada.

##### MAINTAINER
```docker
MAINTAINER <autor> <email>
```
Nos permite indicar el autor del Dockerfile

##### RUN
```docker
RUN <comandos>
```
Ejecuta comandos cuando se está construyendo una imagen personalizada.

##### CMD
```docker
CMD <comandos>
```
Pasa valores por defecto en la imagen para que se ejecuten cuando se lance un contenedor.

##### COPY 
```docker
COPY <origen> <destino>
```
Copia archivos desde <origen> local hacia un <destino> en el contenedor

##### ADD
```docker
ADD <origen> <destino>
```
Copia archivos desde <origen> local ó remoto hacia un <destino> en el contenedor

##### ENV
```docker
ENV <clave=valor>
```
Inicializa variables de entorno (sistema), con el formato "clave=valor".

##### EXPOSE
```docker
EXPOSE <port>
```
Indica los puertos TCP/IP por los que se pueden acceder a los servicios del contenedor.

#### Ejemplos de Dockerfile
Ejemplo de contenido de un Dockerfile que creará una imagen partiendo de Centos e instalará un servidor web:

```docker
FROM centos
RUN yum install httpd -y
CMD apachectl -DFOREGROUND
```

Ejemplo de contenido de un Dockerfile (un poco más complejo) que creará una imagen partiendo de Ubuntu e instalará un servidor web:


```docker
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

```docker
docker build -t <ImageName[:tag]> .
```
Por ejemplo: 

```docker
docker build -t imagenpersonalizada .
```

En caso que tengamos más de un Dockerfile (no pueden llamarse de la misma manera) podemos invocar el nombre del archivo Dockerfile con la opción `-f`:

```docker
docker build -t <ImageName[:tag]> [-f <Nombre del Dockerfile>] .
```

Por ejemplo: 

```docker
docker build -t imagenpersonalizada . -f miDockerfile
```