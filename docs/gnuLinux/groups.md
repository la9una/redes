# Grupos en GNU/Linux

Cuando en GNU/Linux creamos un **usuario** (User), automáticamente se crea un **grupo** (Group) que lleva el mismo nombre del ususario creado. Por defecto, el usuario creado pertenece a su grupo homónimo. Por otro lado, es posible crear grupos y agrupar usuarios a ellos. 

## Archivos de sistema que almacenan información sobre los grupos
Como sabemos, los sistemas basados en UNIX alamacenan la mayor parte de la información en archivos de texto plano. Veamos a continuación umo de ellos. 

### /etc/group
Este archivo guarda la relación de los grupos a los que pertenecen los usuarios del sistema, contiene una línea para cada usuario con tres o cuatro campos por usuario:

```bash
root:x:0:root
ana:x:501:
sergio:x:502:ventas,supervisores,produccion
cristina:x:503:ventas,sergio
```
De izquierda a derecha encontramos 4 campos: 

| Campo   | Descripción         |
| --------- |  ------------------- |
| 1      |Es el nombre del usuario y debe ser único.|
| 2       |Contraseña cifrada o encriptada. Un `*` indica cuenta de _nologin_.|
| 3       |Es el Group ID (GID) o identificación del grupo.|
| 4       |Es opcional e indica la lista de grupos a los que pertenece el usuario.|


Actualmente al crear al usuario con useradd se crea también automáticamente su grupo principal de trabajo GID, con el mismo nombre del usuario. Es decir, si se añade el usuario 'sergio' también se crea el /etc/group el grupo 'sergio'. 


## Gestión de grupos
Los siguientes comandos permiten crear y eliminar grupos, así como modificar los grupos a los que pertenecen los usuarios.

### addgroup 
Agrega un nuevo grupo al sistema. 

##### Sintaxis

```bash
sudo addgroup <nuevo_grupo>
```
##### Ejemplo de uso
Agrega un grupo llamado `migrupo`:

```bash
sudo addgroup migrupo
```

### groupmod (group modification)
Modifica las opciones de un grupo existente. 

##### Sintaxis

```bash
sudo groupmod <opciones> <nombreDeGrupo>
```

##### Opciones de uso frecuente
* `-n` Cambia el nombre del grupo. 

###### Ejemplo de uso
Cambia el nombre del grupo `NombreViejoDelGrupo` por `NombreNuevoDelGrupo`:

```bash
sudo groupmod -n NombreViejoDelGrupo NombreNuevoDelGrupo
```

### groupdel (group delete)
Elimina un grupo determinado. 

##### Sintaxis
```bash
sudo groupdel <NombreDelGrupo>
```

##### Ejemplo de uso
Elimina el grupo llamado `migrupo`:

```bash
sudo groupdel migrupo
```

!!!done "Modificando opciones del propio usuario"
		En caso de modificar opciones relacionadas con nuestro propio usuario, podremos hacerlo sin necesidad de invocar permisos de superusuario. 

## Consultando información sobre usuarios y grupos
Existen una serie de comandos para verificar los grupos de un usuario y su configuración, sean éstos primarios o secundarios

### id
El comando `id` exhibe el UID y el GID de un usuario determinado, así como los grupos a los que éste pertenece. Si ejecutamos el siguiente comando: 

```bash
sudo id <nombreDeUsuario>
```

##### Ejemplo de uso
Para mostrar información relativa al usuario llamado `juan`:

```bash
sudo id juan
```

### groups
El comando `groups` exhibe los grupos asociados a un usuario determinado, sin especificar si éstos son primarios o secundarios en relación a éste. 

```bash
sudo gropups <nombreDeUsuario>
```

##### Ejemplo de uso
Para mostrar los grupos a los cuales está asociado el usuario llamado `juan`, ejecutamos:

```bash
sudo groups juan
```
Si ejecutamos el comando `groups` sin ninguna opción, nos mostrará la información de los grupos del usuario actual. 


