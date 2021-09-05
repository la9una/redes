En la presente guía se desarrolla la instalación y configuración de Docker en Ubuntu Linux. No obstante, podemos consultar en la [documentación oficial](https://docs.docker.com/get-docker/), el proceso de instalación para otros sistemas operativos.

## Instalación en Ubuntu:
Simplemente, ejecutamos en una terminal: 

```bash
sudo apt install docker.io
```

## Agregar usuario a Docker
Para poder gestionar Docker con un usuario normal, sin privilegios, ejecutamos: 

```bash
sudo usermod -a -G docker <user>
```

Donde debemos reemplazar `user` por el usuario al cual deseamos delegar la gestión de Docker

## Cambiar el grupo primario del usuario actual
Anula el grupo principal del usuario actual, cambiándolo por el grupo `docker`  

```bash
newgrp docker
```
NOTA: El comando debe ser ejecutado por el usuario que administrará Docker. 