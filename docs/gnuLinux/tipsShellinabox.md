Shellinabox es una aplicación que nos permite ejecutar un emulador de terminal que funciona en un navegador web. 

Para instalar esta aplicación ejecutamos: 

```apache
sudo apt-get install shellinabox  
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

Opcionalmente podemos cambiar el puerto de escucha. 

```apache
Reiniciamos el servicio: 
```
sudo service shellinabox restart

Y acedemos desde un navegador a: 

```apache
http://ip_de_la_maquina:4200
```




