## Contenedores con Docker Compose
Para facilitar la tarea de creción de contenedores, podemos emplear la herramienta **Docker Compose**. 


### Instalación de Docker Compose
Para instalar dicho software en Ubuntu 20.04 LTS, escribimos: 

```bash
sudo apt install docker-compose
```
### Creación del archivo docker-compose.yml
Para utilizar la herramienta, debemos crear un archivo llamado `docker-compose.yml`. El contenido básico de este archivo bien podría ser:

```bash
version: <versión de Docker Compose>
services:
 <Nombre del servicio a lanzar>:
  image: <Nombre de la imagen a emplear>
  container_name: <Nombre del contenedor>
```

Por ejemplo: 

```bash
version: "3"
services:
 web1:
  image: httpd
  container_name: webserver1
```

Otro ejemplo mas completo: 

```bash
version: "3"
services:
 web1:
  image: httpd
  container_name: webserver1
  ports:
   - "5000:80"
  volumes:
   - ./sitio1:/usr/local/apache2/htdocs
 web2:
  image: httpd
  container_name: webserver2
  volumes:
   - ./sitio2:/usr/local/apache2/htdocs
  ports:
   - "5001:80"
```

### Ejecución de Docker Compose
Para inicializar las órdenes contenidas en un archivo docker-compose.yml simplemente, debemos ubicarnos donde éste, y ejecutar: 

```bash
docker-compose up -d
```

Para eliminar los contenedores creados por un archivo Docker Compose ejecutamos: 

```bash
docker-compose down
```

Podés ver otras opciones sobre Docker Compose, [consultando la documentación oficial](https://docs.docker.com/compose/)