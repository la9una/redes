En sistemas tipo *NIX cada elemento o recurso del mismo (archivos, carpetas, impresoras, dispositivos, enlaces, etc.) posee permisos de acceso que ofrecen un importante mecanismo de seguridad ante accesos no deseados.

### Niveles de permisos
Existen 3 categorías (o niveles) de permisos sobre los distintos recursos (archivos, carpetas, impresoras, etc.), a saber:

| Símbolo   | Tipo   | Descripción         |
| --------- | ------ | ------------------- |
| `u`       | User   | Usuario propietario |
| `g`       | Group  | Grupo propietario   |
| `o`       | Others | Otros usuarios      |

### Tipos de permisos
Para cada uno de los **3 niveles de permisos** tenemos **3 tipos de permisos**. Cada uno de ellos posee, además, un valor numérico: 

| Atributo  	| Valor simbólico 	| Valor octal |
| ------------  | ----------------- | ----------- |
| Lectura   	| `r`  	 			| 4           |
| Escritura 	| `w` 	 			| 2       	  |
| Ejecucción	| `x` 	 			| 1      	  |

### Ejemplo de algunos valores de permisos

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


#### Intererpretando los permisos
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

#### Averiguando permisos
Para poder determinar cuáles son los permisos de un determinado recursos, ejecutá el siguiente comando: 

```bash
ls -lh
```
