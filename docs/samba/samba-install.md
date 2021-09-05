Para instalar el paquete básico de samba, a fin iniciar un servidor de compartición de archivos ejecutamos:

```apache
sudo apt-get install -y samba
```

## El archivo de configuración de Samba

Cada vez que configuramos un servicio en GNU/Linux, conviene realizar una copia de seguridad de los archivos que vayamos a modificar de manera de disponer del archivo original en caso de errores de configuración. El archivo de configuración de Samba es `/etc/samba/smb.conf`. Hacemos una copia de seguridad: 

```apache
sudo mv /etc/samba/smb.conf /etc/samba/smb.conf.original
```

Llegado este punto, podemos editar directamente el archivo smb.conf o crear un nuevo archivo en blanco. Por cuestiones de claridad en la explicación, nos inclinaremos por el segundo caso: 

```apache
sudo touch /etc/samba/smb.conf
```

A partir de acá iremos modificando este único archivo de configuración. 

Antes que nada hay que decir que **las opciones de configuración de Samba exceden ampliamente los alcances de esta guía**. En los ejemplos dados a continuación se explica como: 

  * Dotar a cada usuario del sistema de su propia carpeta almacenada en el servidor
  * Compartir una carpeta entre los usuarios del sistema
  * Compartir una carpeta de manera anónima en la red


## Configuración general de Samba

```apache
sudo nano /etc/samba/smb.conf
```

Y procedemos al incluir los datos de configuración del servidor:

```apache
[global]
	# Grupo de trabajo
	workgroup = WORKGROUP

	# Nombre visible del servidor en la red
	server string = Servidor Samba %v en %L

	# Nombre corto del servidor en la red NetBIOS
	netbios name = SambaUbuntu

	# Acceso a Samba sólo para usuarios
	security = user

	# Las solicitudes de conexión con clave incorrecta se rechazan.
	# En ese caso, los usuarios no serán tratados como invitados. 
	map to guest = never

	# Desactivar el servidor de nombres, útil si 
	# Samba actúa como servidor Wins.  
	dns proxy = no

```


!!!tip "Grupo de trabajo"
		Reemplazar **WORKGROUP** por el nombre de **grupo de trabajo** de los clientes **Windows**. Si no conocés el nombre de trabajo en el que se encuentra un cliente, ejecutá en la terminal de Windows (cmd):

		```
		net config workstation
		```

Cerramos el archivo habiendo guardado los cambios y reiniciamos el servicio Samba:

```apache
sudo service smbd restart
```

!!!done "Secciones"
	El archivo de configuración de Samba está dividido en secciones que comienzan con el nombre de la sección encerrada entre corchetes. Ninguna sección es obligatoria aunque las más comunes son: `[global]` en la que se determina el comportamiento general (global) del servidor Samba, `[homes]` que permite compartir las carpetas `home` de los usuarios de GNU/LInux en Windows y `[printers]` que permite compartir impresoras en la red. 

	Sin embargo, se pueden crear secciones personalizadas, por ejemplo `[profesores]` y `[alumnos]`, etc. y personalizar para cada una, las opciones de compartición. 