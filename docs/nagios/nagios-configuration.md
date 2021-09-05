Una vez que hayamos instalado Nagios, disponemos de la carpeta `/etc/nagios4` que contiene los archivos de configuración del programa.

A fin de mantener el orden, **crearemos una carpeta en la que alojaremos nuestros archivos de configuración personalizados**. Tanto el nombre de la carpeta que crearemos, como su ubicaiión son arbitrarios, pudiéndose emplear otros en su lugar: 

```bash
sudo mkdir /etc/nagios4/objetos
```

## Creando nuestros archivos de configuración


Dentro de la carpeta que creamos del paso anterior, **colocaremos nuestros archivos de configuración** los cuáles tendremos que crear, asignándoles un nombre arbitrario, pero con la extensión **.cfg**. Los archivos que crearemos serán: `equipos.cfg`, `grupos.cfg` y `servicios.cfg`.

```bash
cd /etc/nagios4/objetos/ && sudo touch equipos.cfg grupos.cfg servicios.cfg iconos.cfg
```

## Agregando nuestra configuración a Nagios


Tendremos que "notificar" a Nagios de los cambios que hemos introducido. Para ello, abriremos el archivo de configuración principal de Nagios: 

```bash
sudo vim /etc/nagios4/nagios.cfg
```

Una vez abierto el archivo, en algún lugar del mismo, agregaremos la siguiente línea que indica la ubicación de nuestro archivo de configuración: 

```apache
# Equipos que forman parte de la red
cfg_file=/etc/nagios4/objetos/equipos.cfg
  
# Grupos de equipos
cfg_file=/etc/nagios4/objetos/grupos.cfg

# Servicios que Nagios monitoreará
cfg_file=/etc/nagios4/objetos/servicios.cfg

# Iconos personalizados
cfg_file=/etc/nagios4/objetos/iconos.cfg
```

Para finalizar, guardaremos los cambios y cerraremos el editor.

## Verificando la configuración y reiniciando Nagios
Cada vez que realicemos cambios en los archivos de configuración del servidor tendremos que verificar que dichar configuración sea la correcta. Para ellos ejecutaremos el siguiente comando:

```bash
sudo nagios4 -v /etc/nagios4/nagios.cfg
```


!!!note "Advertencias y errores" 
	El comando emite dos tipos de mensajes: **Warnings** y **Errors**. Los primeros, constituyen adevertencias que no interrumpirán el funcionamiento del servidor. Los errores, en cambio, harán que el servidor deje de funcionar por lo que tendremos que solucionarlos para volver a activar el servicio.


Si la configuración está libre de errores entonces podremos reiniciar el servidor: 

```bash
sudo service nagios4 restart
```

Si todo salió bien, podremos ingresar al panel web de administración desde un navegador y ver plasmados los cambios realizados. 

## Panel de administración
A continuación se listan algunas opciones del panel de administración web de Nagios que se configurarán en el presente curso: 

![Panel de Nagios](imgNagios/nagiospanel.png)

Donde:

|#|Nombre|Descripción|
|----|----|----|
|1|Tactical Overview|Resumen del estado de la red|
|2|Map|Mapa de conexiones y dispositivos de la red|
|3|Hosts|Detalle de los equipos de la red|
|4|Services|Detalle de los servicios monitoreados (por equipo)|
|5|Host Groups|Grupos de equipos|

