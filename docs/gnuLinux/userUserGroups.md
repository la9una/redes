## Usuarios en GNU/Linux
Linux es un sistema multiusuario, por lo tanto, la tarea de añadir, modificar, eliminar y en general administrar usuarios se convierte en algo no solo rutinario, sino importante, además de ser un elemento de seguridad.

Podemos identificar al menos, tres tipos de usuarios:

**Usuario root**
*	También llamado superusuario o administrador.
*	Su UID (User ID) es 0 (cero).
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

### Gestión de usuarios
adduser
usermod
userdel
passwd

## Grupos en GNU/Linux

Cuando en GNU/Linux creamos un **usuario** (User), automáticamente se crea un **grupo** (Group) que lleva el mismo nombre del ususario creado. Por defecto, el usuario creado pertenece a su grupo homónimo. Por otro lado, es posible crear grupos y agrupar usuarios a ellos. 

### Gestión de grupos
addgroup
groupmod
groupdel




!!!done "Información sobre usuarios y grupos"
		id 
		finger


## Permisos
Existen 3 categorías (o niveles) de permisos sobre los distintos recursos (archivos, carpetas, impresoras, etc.), a saber:

| Símbolo   | Tipo   | Descripción         |
| --------- | ------ | ------------------- |
| `u`       | User   | Usuario propietario |
| `g`       | Group  | Grupo propietario   |
| `o`       | Others | Otros usuarios      |

Para cada uno de los **3 niveles de permisos** tenemos **3 tipos de permisos**. Cada uno de ellos posee, además, un valor numérico: 

| Atributo  	| Valor simbólico 	| Valor octal |
| ------------  | ----------------- | ----------- |
| Lectura   	| `r`  	 			| 4           |
| Escritura 	| `w` 	 			| 2       	  |
| Ejecucción	| `x` 	 			| 1      	  |

Entonces, un recurso que posee permisos totales,será: 
	| Atributo  | Valor simbólico | Valor octal |
| -------   | ------ | ------------------- |
| Lectura   | r   | 4           |
| Escritura | w | 2           |
| Ejecucción | x | 1      |
		U	G	O
Simbólico	rwx	rwx	rwx
Octal		7	7	7

¿Qué permisos tiene?
		U	G	O
Simbólico	rwx	r-x	r--
Octal		7	5	4

Simbólico	rw-	r--	r--
Octal		6	4	4



Finalmente, existen **otros** (Others) usuarios en el sistema. 

Esto se representa simbólicamente: 

|         | Usuario (User) | Grupo (Group) | Otros (Others) |
| ------- | -------------- | ------------- | -------------- |
| Símbolo | u              | g             | o              |

Donde, en relación a la propiedad de un recurso determinado:
* **u** (User), simboliza el usuario propietario de un recurso, 
* **g** (Group), representa el grupo propietario de un recurso,
* **o** (Others), refieren al resto de los usuarios del sistema. 


Los permisos indican a cuáles recursos pueden acceder los usuarios y con que nivel de acceso pueden hacerlo. Cada tipo de permiso se puede representar con una letra y poseen un valor numérico fijo asignado:  

|         | Lectura (Read) | Escritura (Write) | Ejecucción (Execute) |
| ------- | -------------- | ----------------- | -------------------- |
| Símbolo | r              | w                 | x                    |
| Valor   | 4              | 2                 | 1                    |

Cada usuario o grupo puede poseer distintos niveles de acceso a los recursos. Estos niveles de acceso están dados por la capacidad de leer, escribir o ejecutar uno o varios recursos determinados.  

* **r** (Read), permiso de lectura
* **w** (Write) , permiso de escritura
* **x** (Execute), permiso de ejecucción





