A continuación se listan ejercicios en los que deberás aplicar los conocimientos adquiridos. Como norma general, la secuencia de pasos a seguir es la siguiente: 

**Como usuario root**

1. Crear el usuario o los usuarios que necesitemos
2. Ubicarnos en la carpeta `/etc/apache2/sites-available`
3. Crear el archivo de configuración para nuestro dominio con la extensión `.conf` (por ejemplo, `unsitioficticio.net.conf`) 
4. Habilitar el sitio (por ejemplo, `a2ensite unsitioficticio.net.conf`) y reiniciar Apache
5. Modificar el archivo `hosts` (en nuestra máquina física)
6. Ingresar al sitio con el navegador 

**Como usuarios normales**

1. Crear dentro de la `home` del usuario, la carpeta `public_html`, es decir `/home/<usuario>/public_html`
2. Generar el contenido del sitio (`index.html`, `index.php`, etc) y colocarlo en la carpeta creada en el punto anterior

## Ejercicio 1

La empresa "Penguin S.A.", dispone de un servidor web dedicado y tan solo una direccion IP. La empresa necesita que su servidor web gestione diferentes sitios web, cada uno con su nombre de dominio.

Hablando con ejecutivos de la empresa, se acuerda en desplegar las siguientes plataformas webs: 

1. Sitio oficial
2. Sucursal Patagonia
3. FrontEnd para la administración de la  base de datos MySQL. 

En la siguiente tabla se indican además las respectivas rutas donde deberán alojar los archivos de los sitios web. 


| #    | Dominio                | Directorio raíz (DocumentRoot)           |
| ---- | ---------------------- | ---------------------------------------- |
| 1    | penguin.net            | `/home/penguin/public_html`    |
| 2    | patagon.penguin.net    | `/home/patagon/public_html` |
| 3    | phpmyadmin.penguin.net | `/usr/share/phpmyadmin`              |



#### Instalación de paquetes

Deberá [instalarse un entorno LAMP](lamp-install.md) necesario para el despliegue de los sitios web. 

#### Creación de usuarios
Para poder realizar el ejercicio deberás crear previamente los usuarios **penguin** y **patagon**. 


#### Creación los directorios raíz

La acción deberá realizarse para los dominios **penguin.net** y **patagon.penguin.net** tomando en cuenta los datos que figuran en el cuadro acordado con el cliente. 

#### Creación de contenido web

Dentro de los **directorios raíz** creados en el punto anterior (necesariamente deberá existir una página llamada index.html o index.php) y a modo de ejemplo, deberán crearse las siguientes páginas: 

1. Para **penguin.net**: un archivo `index.html` con la frase "Penguin.net - Sitio Oficial"
2. Para **patagon.penguin.net**, un archivo `index.php` con el siguiente contenido: 

```php linenums="1"
<!DOCTYPE html>
<html>
	<head>
		<title>Penguin S.A.</title>
	</head>
	<body>
		<h1>Penguin.Net Patagon</h1>
		<p>Sitio en construccion</p>
		<?php 
			# Muestra la fecha y hora actual de Buenos Aires
			ini_set('date.timezone','America/Argentina/Buenos_Aires');
			echo date("d-m-Y (H:i A)");
		?>
	</body>
</html>
```


#### Creación de los archivos de configuración ####

Se deben crear los archivos de configuración de cada [Host Virtual](lamp-virtualhosts.md) solicitado por el cliente. Tener en cuenta que para todos los casos, el administrador sera `admin@penguin.net`.

#### Resolución de nombres ####
Se debe realizar a través del [método del archivo hosts](../../dns/dns-hosts/).

!!! tip "Automatización de tareas"
	Sería más practico realizar todas las acciones anteriores valiendose de un script. ¿Te animás a escribirlo? 


## Ejercicio 2

Una vez que hayamos [instalado correctamente el entorno LAMP](lamp-install.md) podremos instalar en el servidor web distintas aplicaciones webs que funcionen con dicha tecnología (PHP y MySQL). 

Crea los siguientes dominios: 

| Dominio    | Usuario                | Directorio raíz (DocumentRoot)           |
| ---- | ---------------------- | ---------------------------------------- |
| itel.lan    | itel            | `/home/itel/public_html`    |
| egresados.fest    | promo    | `/home/promo/public_html` |

E instala las siguientes aplicaciones: 

* Wordpress en `itel.lan`
* Joomla! en `egresados.fest`

Podemos encontrar las aplicaciones en internet:

* [Dolibarr](https://www.dolibarr.org/downloads)
* [Dokuwiki](https://download.dokuwiki.org/)
* [FengOffice](https://www.fengoffice.com/web/community/downloads.php)
* [Joomla!](https://downloads.joomla.org/es/cms/joomla3)
* [Wordpress](https://wordpress.org/download/)

O bien descargarlas desde la red local, disponibles en [http://192.168.0.200/aplicaciones](http://192.168.0.200/aplicaciones)

En cualquier caso, descargamos la aplicación seleccionada en el directorio raíz de nuestro sitio web:  

```bash
wget http://url_de_la_aplicacion/aplicacion.zip
```
Luego, **descomprimimos la aplicación descargada en el directorio raíz de nuestro sitio**. Abrimos nuestro navegador web y visitamos la dirección web `http://tudominio/aplicacion` o bien `http://tuDireccionIP/aplicacion` y seguir las instrucciones de instalación. 

!!! warning "Gestión de la base de datos"
	Dependiendo de la aplicación web que hayas elegido, es posible que necesites crear una base de datos. Para ello, dirigite a `http://tudominio/phpmyadmin` o `http://tuDireccionIP/phpmyadmin` e ingresá con las credenciales del usuario root. Una vez allí podrás crear la base de datos solicitada.




