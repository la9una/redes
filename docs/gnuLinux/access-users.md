# Usuarios en GNU/Linux
Linux es un sistema multiusuario, por lo tanto, la tarea de añadir, modificar, eliminar y en general administrar usuarios se convierte en algo no solo rutinario, sino importante, además de ser un elemento de seguridad.

Podemos identificar al menos, tres tipos de usuarios:

**Usuario root**

* También llamado superusuario o administrador.
* Su UID (User ID) es 0 (cero).
* Es la única cuenta de usuario con privilegios sobre todo el sistema.
* Acceso total a todos los archivos y directorios con independencia de propietarios y permisos.
* Controla la administración de cuentas de usuarios.
* Ejecuta tareas de mantenimiento del sistema.
* Puede detener el sistema.
* Instala software en el sistema.
* Puede modificar o reconfigurar el kernel, controladores, etc.

**Usuarios especiales**

* También llamados usuarios de sistema.
* Su UID (User ID) está entre 1 y 999.
* Ejemplos: bin, daemon, adm, lp, sync, shutdown, mail, operator, squid, apache, etc.
* Se les llama también cuentas del sistema.
* No tiene todos los privilegios del usuario root, pero dependiendo de la cuenta asumen distintos privilegios de root.
* No tienen contraseñas pues son cuentas que no están diseñadas para iniciar sesiones con ellas  (también llamadas cuentas de "no inicio de sesión" o _nologin_).
* Se crean (generalmente) automáticamente al momento de la instalación de Linux o de una aplicación.

**Usuarios normales**

* Son las personas o usuarios finales que utilizarán el sistema operativo. 
* Su UID (User ID) a partir de 1000. 
* Cada usuario dispone de un directorio de trabajo ubicado en `/home/<usuario>`.
* Poseen privilegios totales únicamente sobre los recursos alojados en su directorio de trabajo.
* El inicio de sesión generalmente está protegido por contraseña o clave de cifrado.

## Archivos de sistema que almacenan información sobre los usuarios
Como sabemos, los sistemas basados en UNIX alamacenan la mayor parte de la información en archivos de texto plano. Veamos a continuación algunos de ellos. 

### /etc/passwd
Cualquiera que sea la cuenta de usuario, todas ellas se encuentran definidas en el archivo de configuración `/etc/passwd`. Este archivo es de texto tipo ASCII, se crea al momento de la instalación con el usuario `root` y las cuentas especiales, más las cuentas de usuarios normales que se hayan indicado al momento de la instalación.

Podemos consultarlo ejecutando el siguiente comando: 

```bash
sudo less /etc/passwd
```

El archivo /etc/passwd contiene una línea para cada usuario, similar at las siguientes

```bash
root:x:0:0:root:/root:/bin/bash
sergio:x:501:500:Sergio González:/home/sergio:/bin/bash
```

Como podemos observar, existen "campos" delimitados por dos puntos `:`. De izquierda a derecha son 7 (siete): 


| Campo   | Descripción         |
| --------- |  ------------------- |
| 1      |  Es el nombre del usuario y debe ser único.|
| 2       |  La 'x' indica la presencia de contraseña (encriptada) del usuario.|
| 3       |Número de identificación del usuario (UID). Debe ser único.|
| 4       |Numeración de identificación del grupo (GID). El que aparece es el número de grupo principal del usuario, y grupos secundarios, en caso de existir.|
| 5       |Comentarios o el nombre completo del usuario.|
| 6       |Directorio de trabajo donde se sitúa al usuario después del inicio de sesión (generalmente es `/home/usuario`).|
| 7       |Shell que va a utilizar el usuario de forma predeterminada.|


### /etc/shadow
El archivo `/etc/shadow` contiene las contraseñas cifradas de los usuarios. Contiene una línea para cada usuario, almacenando información adicional de los mismos. Un ejemplo de contenido de este archivo: 

```bash
root:ghy675gjuXCc12r5gt78uuu6R:10568:0:99999:7:7:-1::
sergio:rfgf886DG778sDFFDRRu78asd:10568:0:-1:9:-1:-1::
```

La información de cada usuario está dividida en 9 campos delimitados cada uno por `:` dos puntos:

| Campo   | Descripción         |
| --------- |  ------------------- |
| 1      |Es el nombre del usuario y debe ser único.|
| 2       |Contraseña cifrada o encriptada. Un `*` indica cuenta de _nologin_.|
| 3       |Días transcurridos desde el 01/01/1970 hasta la fecha en que la contraseña fue cambiada por última vez.|
| 4       |Número de días que deben transcurrir hasta que la contraseña se pueda volver a cambiar.|
| 5       |Número de días tras los cuales hay que cambiar la contraseña. (-1 significa nunca). A partir de este dato se obtiene la fecha de expiración de la contraseña.|
| 6       |Número de días antes de la expiración de la contraseña en que se le avisará al usuario al inicio de la sesión.|
| 7       |Días después de la expiración en que la contraseña se inhabilitara, si es que no se cambio.|
| 8       |Fecha de caducidad de la cuenta. Se expresa en días transcurridos desde el 01/01/1970.|
| 9       |Reservado.|


## Gestión de usuarios
A continuación se listan los comandos necesarios para agregar, eliminar y modificar los usuarios del sistemas y sus atributos. 

### adduser
Para agregar usuarios al sistema

##### Sintaxis

```bash	
sudo adduser <nombreDelNuevoUsuario>
```

##### Ejemplo de uso 
Crear el usuario `juan`, solicitando el ingreso de su contraseña durante el proceso. 

```bash	
sudo adduser juan
```

### usermod (user modification)
Modifica diversos atributos del usuario.

##### Sintaxis

```bash	
sudo usermod <opciones> <nombreDeUsuario>
```

##### Opciones de uso frecuente

* `-c` Cambiar el nombre para mostrar del usuario
* `-d` Cambiar el directorio “home” del usuario
* `-s` Cambiar el “shell” del usuario
* `-g` Modifica el grupo primario del usuario
* `-G` Modifica el o los grupo/s secundario/s del usuario
* `-L` Deshabilitar el acceso del usuario
* `-U` Habilitar el acceso del usuario

##### Ejemplos de uso 
Modifica la `home` del usuario `pedro` por `/tmp/directorio`:

```bash	
sudo usermod -d /tmp/directorio pedro
```

Deshabilita el acceso o _login_ del usuario `pedro`:

```bash	
sudo usermod -L pedro
```

Deshabilita el uso de la “shell” para el usuario `pedro`:

```bash	
sudo usermod -s /dev/null pedro
```

Cambia el grupo principal del usuario `pedro` a `grupete`:

```bash	
sudo usermod -g grupete pedro
```

Agrega el usuario `pedro` a los grupos secundarios `grupo1` y `grupo2`. Si volvemos a ejecutar el comando, omitiendo el nombre de algún grupo, el usuario dejará de pertenecer al grupo omitido:

```bash	
sudo usermod -G grupo1,grupo2 pedro
```

### userdel (user delete)
Elimina una cuenta de usuario existente. 

##### Sintaxis

```bash
sudo userdel <nombreDeUsuario>
```

##### Opciones de uso frecuente

* `-r` Elimina el usuario junto a todos sus archivos personales. 

##### Ejemplo de uso
Elimina el usuario `pedro` y su directorio `home` y configuraciones adicionales:

```bash
sudo  userdel -r pedro
```

### passwd (password)
Modifica la contraseña de un usuario existente. 

##### Sintaxis
```bash
sudo passwd <nombreDeUsuario>
```

##### Ejemplo de uso

Solicita una nueva contraseña para el usuario llamado `juan`:

```bash
passwd juan
```