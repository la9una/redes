Es posible crear un **espacio web para cada usuario del sistema**, donde éstos pueden alojar su propio contenido web. 

!!! note "Usuarios"
	En los ejemplos listados en esta página deberás cambiar **usuario** por el nombre de usuario al que deseemos dotar de un espacio web.

## Creando el contenido del sitio web


En primer lugar, creamos el directorio en el cual se agregarán las páginas webs del usuario:

```bash
mkdir /home/usuario/public_html
```
Solo resta agregar el contenido del sitio web dentro de la carpeta `public_html` que acabamos de crear. Tené en cuenta debe existir necesariamente al menos un archivo índice. Por ejemplo: `index.html`


!!! tip "El directorio `/etc/skel`"
	En sistemas GNU/Linux, el contenido del directorio `/etc/skel` se _carga_ dentro de la carpeta `home` de cada usuario al momento de que estos son creados. Por tanto, podemos modificar el contenido de `/etc/skel` incluyendo en dicho directorio el contenido que necesitemos. Por ejemplo, el directorio `public_html`

## Habilitando el módulo userdir

Para proveer a los usuarios de un espacio web dentro de su carpeta `home` todavía tendremos que dar un paso más: habilitar el módulo de Apache llamado `userdir`. Para ello, ejecutamos en la terminal: 

```bash
sudo a2enmod userdir
```

Luego, reiniciamos el servidor para que incorpore los cambios:

```bash
sudo systemctl restart apache2
```

## Permitiendo el uso de PHP en public_html

Para habilitar la ejecucción de scripts PHP dentro de directorio `public_html` de los usuarios, tendremos que asegurarnos que el módulo PHP esté activado. Una vez realizada esta comprobación, abriremos con permisos administrativos el siguiente archivo:

```bash
nano /etc/apache2/mods-available/php<version>.conf
```
Donde `<version>` hace referencia al número de versión de PHP instalada. 

Un vez abierto el archivo, tenemos que desplazarnos hasta el final del archivo hasta ubicar el siguiente bloque de código:

```apache linenums="1" hl_lines="3"
<IfModule mod_userdir.c>
    <Directory /home/*/public_html>
        php_admin_flag engine Off
    </Directory>
</IfModule>
```
Y _seteamos_ la directiva `php_admin_flag engine` en `On`: 

```apache linenums="1" hl_lines="3"
<IfModule mod_userdir.c>
    <Directory /home/*/public_html>
        php_admin_flag engine On
    </Directory>
</IfModule>
```

Para hacer efectivos los cambios realizados, reiniciamos Apache: 

```bash
sudo systemctl restart apache2
```

## Aceso a la web del usuario

Una vez concluidos los pasos anteriores, podemos acceder a la web del usuario escribiendo en el navegador `http://direccionIPServidor/~usuario` o bien `http://nombreDominioServidor/~usuario`.
