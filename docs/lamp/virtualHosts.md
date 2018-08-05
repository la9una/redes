Una de las aplicaciones de la característica de Apache llamada _VirtualHosts_ consiste en la posibilidad de crear **diferentes sitios web** cada uno con su **nombre de dominio propio** aunque éstos se encuentren alojados en un mismo servidor y, por lo tanto, tengan **la misma dirección IP**. 

!!! blockquote "¿Qué es Virtual Host?"

	El término **Hosting Virtual** se refiere a hacer funcionar más de un sitio web tales como `www.company1.com` y `www.company2.com` en una sola máquina. 

	Los sitios web virtuales pueden estar **basados en direcciones IP**, lo que significa que cada sitio web tiene una dirección IP diferente, o **basados en nombres diferentes**, lo que significa que con una sola dirección IP están funcionando sitios web con diferentes nombres (de dominio). 

	El hecho de que estén funcionando en la misma máquina física pasa completamente desapercibido para el usuario que visita esos sitios web.

## Configurando el Host Virtual

Para iniciar la configuración de nuestro _host virtual_ nos dirigiremos a la siguiente carpeta: 

```bash
cd /etc/apache2/sites-available
```

Una vez ubicados en el directorio correspodiente nos disponemos a crear el **archivo de configuracion del Host Virtual** (el archivo en cuestión puede llamarse de cualquier forma, pero debe finalizar necesariamente con la extension `.conf`)

```bash
nano midominio.tld.conf
```

Y a continuación escribimos la configuración de nuestro Host Virtual. Un ejemplo simple de configuracion para el sitio ficticio `misitio.lan`:


```apache linenums="1"
###################################
### Definición del Host Virtual ###
###################################

<VirtualHost *:80>

	# Correo del administrador del servidor
	ServerAdmin		tunombre@mail.com
	 
	# Nombre de dominio del sitio
	ServerName		midominio.tld

	# Alias del nombre de dominio del sitio
	ServerAlias		www.midominio.tld http://midominio.tld

	# Carpeta raíz donde se alojarán las páginas web 
	DocumentRoot	/home/<usuario>/public_html	
	 
	# Ruta en la que Apache escribirá el registro de errores
	ErrorLog		/home/<usuario>/public_html/errores.log

	# Ruta en la que Apache escribirá el registro accesos
	CustomLog		/home/<usuario>/public_html/accessos.log combined

</VirtualHost>


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

!!! info "Archivos de log"
	Los archivos de _log_ son archivos en los que el sistema guarda información sobre el funcionamiento de algún servicio determinado indicando errores, advertencias, accesos, etc. En distribuciones GNU/Linux, se encuentran alojados bajo la ruta `/var/log/`. En el ejemplo, se ha optado por guardar dichos archivos en la carpeta home del usuario. 

!!! help "Documentación de Apache Web Server"
	La presente guía está basada en la versión 2.4.x del servidor web incluida en Ubuntu Server 16.04 LTS. Es recomendable consultar la [extensa documentación oficial](https://httpd.apache.org/docs/2.4/es/) para profundizar los conceptos abordados en la práctica.  

## Verficicando archivo de configuración
Para verificar que la sintaxis del host virtual es la correcta, ejecutamos: 

```bash
sudo apache2ctl -t
```

## Habilitando el sitio creado

Para que Apache ponga el sitio en modo **habilitado** (hasta ahora lo definimos, pero no lo habilitamos), ejecutamos en la terminal:

```bash
sudo a2ensite misitio.tld.conf
```

!!! done "¿Qué ocurre cuando habilitamos un sitio?"
El comando anterior creará un [enlace simbólico](https:_es.wikipedia.org/wiki/Enlace_simb%C3%B3lico) del archivo `misitio.lan.conf` desde la carpeta `/etc/apache2/sites-available` hacia la carpeta `/etc/apache2/sites-enabled`. 

## Reiniciando Apache 
Por último, para que Apache haga efectivo todos los cambios, lo reiniciamos: 

```bash
sudo service apache2 restart
```
 
