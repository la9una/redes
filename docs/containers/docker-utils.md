Comandos de uso frecuente para la gestión de contenedores Docker. 

### Historial de una imagen

```bash
docker history -H <imageName[:tag]>
```

### Información acerca la instalación de Docker

```bash
docker info
```

### Iniciar, parar, reiniciar un contenedor

```bash
docker [start|stop|restart] <Nombre del contenedor>
```

Por ejemplo: 

```bash
docker restart mycontainer
```

### Eliminar recursos

Podemos eliminar cualquier recurso (imágenes, contenedores, volúmenes y redes) que estén pendientes (no asociados con un contenedor) con el siguiente comando: 

```bash
docker system prune
```
 
Para eliminar adicionalmente los contenedores detenidos y todas las imágenes no utilizadas (no solo aquellas pendientes), añada el indicador -a al comando:

```bash
docker system prune -a
 ```
