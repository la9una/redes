Sugerencias, trucos para mejorar tu experiencia usando GNU/Linux

## Visualizando archivos y carpetas en forma de árbol
La herramienta `tree` como su nombre lo indica, muestra el sistema de archivos bajo la forma de árbol, ofreciendo una experiencia más usable. 

Es necesario instalarla, ejecutando: 

```apache
sudo apt install tree -y
```

### Opciones de uso frecuente

* `-u` imprime el nombre del usuario dueño de cada recurso
* `-g` imprime el nombre del grupo propietario de cada recurso
* `-p` imprime los permisos de cada recurso
* `-s` imprime el tamaño de cada recurso
* `-t` imprime los recursos ordenándolos según fecha de modificación
* `-D` imprime fecha de la última modificación de cada recurso
* `–dirsfirst` lista los directorios en primera lugar
* `-r` muestra la salida en orden alfabético inverso



### Ejempo de uso

```apache
tree -pug carpeta
```
Muestra el contenido de `carpeta` en forma de árbol, exhibiendo usuarios y grupos así como los permisos. 


## Ejecutando la terminal en el navegador 

Shellinabox es una aplicación que nos permite ejecutar un emulador de terminal que funciona en un navegador web. 

Para instalar esta aplicación ejecutamos: 

```apache
sudo apt install shellinabox -y
```
Luego, tendremos que editar el archivo de configuración de la aplicación: 

```apache
vim /etc/default/shellinabox
```

Una vez abierto el archivo deshabilitaremos el protocolo `https`. Para ello tendremos que modificar la siguiente línea:

```apache
SHELLINABOX_ARGS="--no-beep"
```

Para que quede de la siguiente manera: 

```apache
SHELLINABOX_ARGS="--no-beep --disable-ssl" 
```

Reiniciamos el servicio: 

```apache
sudo service shellinabox restart
```

Y acedemos desde un navegador a: 

```apache
http://ip_de_la_maquina:4200
```

