Los contenedores Docker ejecutan instancias de imágenes Docker. Por tanto, son instantáneas, "snapshots", "fotografías" de las imágenes a partir de las cuales se crean. 


## Gestión de contenedores
Los contenedores son extremadamente ligeros y efímeros. Pueden crearse con facilidad en cuestión de segundos. También detenerse, reiniciarse, y elminarse con con la misma facilidad. 


### Creando un contenedor
La creación de un contenedor no es otra cosa que ejecutar una imagen. La sintaxis general es: 

```bash
docker run [-d] [-i] [-t] [-p <HOST_PORT>:<CONTAINER_PORT>] <ImageName[:tag]> .
```

Con las siguientes opciones:

* `-d` (detach): enviamos el contenedor al segundo plano. De esta manera podemos seguir usando la terminal sin que esté ocupada. 
* `-p` (port), indicamos el puerto de escucha del contenedor.
* `-i` (interactive): nos permite interactuar con el contenedor a través de comandos
* `-t` (terminal): para iniciar un emulador de terminal donde ejectuar comandos

Ejemplo: 

```bash
docker run -d --name mycontainer ubuntu 
```

Otro ejemplo: 

```bash
docker run -it --name mycontainerinteractive ubuntu /bin/bash
```

Un último ejemplo abriendo puertos:

```bash
docker run -d --name mywebserver -p 3000:80 ubuntu 
```

### Visualizar contenedores
Podemos ver los contenedores que está ejecutándose con el siguiente comando: 

```bash
docker ps [-a]
```
Si agregamos la opción -a podremos, además, visualizar la lista completa de contenedores, incluso aquellos que no se estén ejecutando.

### Conectarnos a la terminal de un contenedor

```bash
docker attach <containerName>
```
### Ejecutar un comando de manera externa al contenedor

```bash
docker exec <containerName> <command>
```

### Ingresar a un contenedor que está corriendo

```bash
docker exec -it <container-id> bash
```

### Eliminando contenedor

```bash
sudo docker rm [-fv] <containerName>
```