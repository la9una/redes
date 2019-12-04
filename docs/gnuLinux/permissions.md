En sistemas tipo `*NIX` cada elemento o recurso del mismo (archivos, carpetas, impresoras, dispositivos, enlaces, etc.) posee permisos de acceso que ofrecen un importante mecanismo de seguridad ante accesos no deseados.


## Niveles de permisos
Existen 3 categorías (o niveles) de permisos sobre los distintos recursos (archivos, carpetas, impresoras, etc.), a saber:

| Símbolo   | Tipo   | Descripción         |
| --------- | ------ | ------------------- |
| `u`       | User   | Usuario propietario |
| `g`       | Group  | Grupo propietario   |
| `o`       | Others | Otros usuarios      |

## Tipos de permisos
Para cada uno de los **3 niveles de permisos** tenemos **3 tipos de permisos**. Cada uno de ellos posee, además, un valor numérico: 

| Atributo  	| Valor simbólico 	| Valor octal |
| ------------  | ----------------- | ----------- |
| Lectura   	| `r`  	 			| 4           |
| Escritura 	| `w` 	 			| 2       	  |
| Ejecucción	| `x` 	 			| 1      	  |

## Ejemplo de algunos valores de permisos

Teniendo en cuenta lo antes expuesto, un recurso que posee permisos totales será:

| Formato   | u (user) | g (group) | o (others) |
| --------- | -------- | --------- | ---------- |
| Simbólico | rwx      | rwx       | rwx        |
| Octal     | 7        | 7         | 7          |

Los valores numéricos asignados a cada símbolo (`r`, `w` y `x`) se suman para obtener el valor octal del permiso. Es decir: `r + w + x = 4 + 2 + 1 = 7`. Esto debe hacerse para cada nivel de permisos: `user`, `group` y `others`.

!!!question "¿Los tipos de permisos se escriben en cualquier orden?"
		La respuesta es NO. Tanto los niveles como los tipos de permisos se leen siempre de izquierda a derecha, y en este orden: 

		* Para los niveles de permisos: `u`, `g` y `o`
		* Para los tipos de permisos: `r`, `w` y `x`


### Interpretando los permisos
No hay mejor manera de comprender el modo en que se expresan los permisos que practicando. Determiná el valor de los siguientes permisos, expresando tu respuestas en formato simbólico u octal, según corresponda:  

1. `rwxr-xr-x`
2. `r--r--r--`
3. `rw-rw-r-x`
4. `644`
5. `700`
6. `442`

???done "Respuestas"
	1. `755`
	2. `444`
	3. `665`
	4. `rw-r--r--`
	5. `rwx------`
	6. `r--r---w-`

### Consultando permisos
Para poder determinar cuáles son los permisos de un determinado recursos, ejecutá el siguiente comando: 

```bash
ls -lh
```

El comando nos devolverá la lista de recursos disponibles en el lugar del árbol de directorios donde estemos posicionados: 

```bash

drwxrwxr-x 2 raul raul 4096 Oct 12 16:00 scripts
-rwxrwxrwx 1 raul raul  460 Oct 12 15:39 chmod.txt
-rw-rw-r-- 1 raul raul  347 Oct 12 15:56 chown.txt
-rwxrwxrwx 1 raul raul  682 Oct 12 15:09 permisos.txt
-rwxrwxrwx 1 raul raul  217 Oct 12 14:48 usuarios.txt

```

Donde:

1. La primer columna está compuesta por 10 caracteres: el primer caracter indica el tipo de archivo y los restantes nueve caracteres, sus permisos en formato simbólico. Respecto al primer caracter, puede adquirir los siguientes valores:
	* `-` archivo
	* `d` directorio
	* `l` enlace simbólico (acceso directo)
	* `b` dispositivo en bloque (dispositivo de hardware) o archivo binario
2. La segunda columna indica el número de enlaces que existen hacia el archivo o directorio
3. La tercer columna representa al propietario del archivo
4. La cuarta columna representa al grupo al que pertence al archivo
5. La quinta columna muestra el tamaño del archivo o directorio expresado en bytes
6. La sexta y séptima columna, exhiben la fecha y hora de última modificación
7. La octava columna indican el nombre del archivo o directorio.

## Gestión de permisos
Podemos gestionar fácilmente los permisos de un recurso, tanto de manera gráfica así como desde la terminal. En nuestro caso, abordaremos la gestión de permisos empleando la terminal de comandos. 

### chmod (change mode)
Se emplea para cambiar permisos a un recurso. 

##### Sintaxis

```bash	
chmod <permisos> <recurso>
```

!!!tip "Formatos de permisos aceptados por chmod"
		Se puede emplear con permisos en formato octal (números entre 0-7) o simbólico (r,w y x). 

##### Ejemplos de uso

**En formato octal**

```bash
chmod 755 archivo.txt
```

**En formato simbólico**

```bash
chmod u+x,g-x,o-wx archivo.txt
```

Otro ejemplo: 

```bash
chmod a+x archivo.txt
```

Donde la letra `a` indica **todos** (all)

!!!waring "Modificando permisos"
		Sólo podemos cambiar permisos a los recursos de los cuáles somos propietarios

### chown (change owner)
Permite cambiar el usuario o grupo propietario de un recurso

##### Sintaxis

```bash
chown <nuevoUsuario>:<nuevoGrupo> <recurso>
```

##### Ejemplo de uso 

El usuario "juan" desea ceder la propiedad del archivo "contabilidad.xls" al usuario "pepe" y a todos los usuarios que pertenecen al grupo "ventas": 

```bash
sudo chown pepe:ventas contabilidad.xls
```

Al archivo `resumen.docx`, que tiene como usuario propietario al usuario `alex`, y como grupo propietario a `alex`, se le cambia sólo el grupo propietario, dejando sin cambios al usuario propietario del mismo: 

```bash
sudo chown :ventas resumen.docx
```

### chgrp (change group)
Modifica el grupo de un recurso existente. 

##### Sintaxis
```bash
chgrp <opciones> <nuevoGrupo> <recurso>
```

##### Opciones de uso frecuente
* `-R` Modifica el grupo de manera recursiva (los cambios se aplican también a los subdirectorios)

##### Ejemplo de uso
Modifica el grupo primario de la carpeta `miCarpeta` por el grupo `administradores`, de manera recursiva:

```bash
sudo chgrp -R administradores miCarpeta
```

