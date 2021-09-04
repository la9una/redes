Una de las aplicaciones de la característica de Apache llamada _VirtualHosts_ consiste en la posibilidad de crear **diferentes sitios web** cada uno con su **nombre de dominio propio** aunque éstos se encuentren alojados en un mismo servidor y, por lo tanto, tengan **la misma dirección IP**. 

!!! blockquote "¿Qué es Virtual Host?"

	El término **Hosting Virtual** se refiere a hacer funcionar más de un sitio web tales como `www.company1.com` y `www.company2.com` en una sola máquina. 

	Los sitios web virtuales pueden estar **basados en direcciones IP**, lo que significa que cada sitio web tiene una dirección IP diferente, o **basados en nombres diferentes**, lo que significa que con una sola dirección IP están funcionando sitios web con diferentes nombres (de dominio). 

	El hecho de que estén funcionando en la misma máquina física pasa completamente desapercibido para el usuario que visita esos sitios web.

## Creando archivo de configuración del Host Virtual

Para iniciar la configuración de nuestro _host virtual_ nos dirigiremos a la siguiente carpeta: 

```bash
cd /etc/apache2/sites-available
```

Una vez ubicados en el directorio correspodiente nos disponemos a crear el **archivo de configuracion del Host Virtual** (el archivo en cuestión puede llamarse de cualquier forma, pero debe finalizar necesariamente con la extension `.conf`)

```bash
nano dominio.tld.conf
```

Y a continuación escribimos la configuración de nuestro Host Virtual. Un ejemplo simple de configuracion para el sitio ficticio `dominio.tld`:


```apache linenums="1"
###################################
### Definición del Host Virtual ###
###################################

<VirtualHost *:80>

	# Correo del administrador del servidor
	ServerAdmin		nombre@mail.com
	 
	# Nombre de dominio del sitio
	ServerName		dominio.tld

	# Alias del nombre de dominio del sitio
	ServerAlias		www.dominio.tld http://dominio.tld

	# Carpeta raíz donde se alojarán las páginas web 
	DocumentRoot	/home/<usuario>/public_html	
	 
	# Ruta en la que Apache escribirá el registro de errores
	ErrorLog		/home/<usuario>/public_html/errores.log

	# Ruta en la que Apache escribirá el registro accesos
	CustomLog		/home/<usuario>/public_html/accessos.log combined

</VirtualHost>

# Nota: reemplazar <usuario> por el nombre de usuario real en cada caso. 
# Por ejemplo: /home/juan/public_html


#########################################
### Permisos sobre el directorio raíz ###
#########################################

<Directory /home/<usuario>/public_html/>
	
	# Indexes permite indexar el contenido del directorio 
	# FollowSymLinks permite acceder a enlaces simbólicos (accesos directos)
	Options Indexes FollowSymLinks

	# Evita que el archivo .htaccess sobreescriba directivas de configuración
    AllowOverride None

    # Permitir el acceso al directorio
    Require all granted

</Directory>     

```

!!! tip "Document Root"
	Aunque no es necesario definir la carpeta raíz de los documentos web dentro del directorio del usuario, sí es una práctica recomendada, especialmente dentro de los proveedores de servicio de [_web hosting_](https://es.wikipedia.org/wiki/Alojamiento_web).

	Bajo el mismo criterio, se incluyen en el directorio del usuario los archivos de [_log_](https://es.wikipedia.org/wiki/Log_(inform%C3%A1tica)) generados automáticamente por Apache.  

!!! help "Documentación de Apache Web Server"
	La presente guía está basada en la versión 2.4.x del servidor web incluida en Ubuntu Server 16.04 LTS. Es recomendable consultar la [extensa documentación oficial](https://httpd.apache.org/docs/2.4/es/) para profundizar los conceptos abordados en la práctica.  

## Habilitando el Host Virtual

Hasta ahora hemos definido nuestro _host_ virtual, pero no lo hemos habilitado. Para "levantar" el sitio, es decir, para que Apache ponga el sitio en modo **habilitado** , ejecutamos en la terminal:

```bash
sudo a2ensite dominio.tld.conf
```
Donde:

* `a2` 		Apache2
* `en`		Enable (habilitar)
* `site`	Sitio web 
* `dominio.tdl.conf` Archivo de configuración del _host_ virtual

!!! done "¿Qué ocurre cuando habilitamos un sitio?"
		El comando anterior creará un [enlace simbólico](https:_es.wikipedia.org/wiki/Enlace_simb%C3%B3lico) del archivo `dominio.tld.conf` desde la carpeta `/etc/apache2/sites-available` hacia la carpeta `/etc/apache2/sites-enabled`. 

## Deshabilitando el Host Virtual
Una vez que hayamos "levantado" el sitio web con el comando `a2ensite` y realicemos cambios en el archivo de configuración del _host_ virtual, para hacer efectivos los cambios tendremos que "bajar" el sitio y luego, volverlo a subir. En ocasiones, tambén nos valeremos de este comando cuando deseemos dejar fuera de linea un sitio.


```bash
sudo a2dissite dominio.tld.conf
```
Donde:

* `a2` 		Apache2
* `dis`		Disable (deshabilitar)
* `site`	Sitio web 
* `dominio.tdl.conf` Archivo de configuración del _host_ virtual


## Reiniciando Apache 
Por último, para que Apache haga efectivo todos los cambios, lo reiniciamos: 

```bash
sudo service apache2 restart
```

Es posible que al hacerlo, Apache nos indique la presencia de errores. Para determinar cuáles son esos errores, ejecutamos: 

```bash
sudo apache2ctl -t
```
Una vez solucionado el problema, podremos reiniciar Apache sin problemas. 

!!! tip "Comandos de gestión de Apache"
		Existen otros comandos ofrecidos por el servidor para gestionar diversas tareas y que podés encontrar en una sección anterior llamada [Gestión básica del servidor](lamp-basics.md#gestion-general-del-servidor). 

## Resolución del nombre de dominio
Nuestro sitio ya está listo para ser "servido" por el Apache de manera que podamos acceder a él mediante un navegador web. Sin embargo, para que esto sea posible, antes tendremos que "avisarle" al resto de los equipos de la red LAN (o del mundo, si nuestro nombre de dominio no es local) que existe un nombre de dominio asociado a una dirección IP determinada y viceversa. 

En otras palabras, precisamos que nuestro equipo "resuelva" dicho nombre de dominio o, lo que es lo mismo, sea capaz de traducir a qué dirección IP apunta el mismo (por ejemplo, la dirección IP correpondiente al dominio `www.itel.edu.ar` es `168.197.51.107`). 

Existen dos caminos para configurar la resolución de nuestros nombres dominios (en nuestro caso, son dominios locales, es decir, no "reales" sólo accesibles desde nuestra red LAN), a saber: 

* [Empleando el archivo hosts de cada equipo](../dns/dns-hosts.md)
* [Configurando un servidor DNS local](../dns/bind) 