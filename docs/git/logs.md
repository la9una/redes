# Historial de confirmaciones (_log_)
Git guarda la historia de todos los _commits_ realizados dentro de un proyecto determinado. Por tanto, es posible consultar este historial para diversos propósitos, usando el comando `log`:

```bash
git log
```

## Formatear la salida del historial

Una opción realmente útil es `--pretty`, que modifica el formato de la salida y donde tenemos unos cuantos estilos disponibles: `oneline`, `short`, `full`, `fuller`, que muestran la salida en un formato parecido, pero añadiendo menos o más información, respectivamente y `format` mediante la cual podemos definir nuestro propio formato :

```bash
git log --pretty=oneline
```

La opción más interesante es format, que te permite especificar tu propio formato:

```bash
git log --pretty=format:"%h - %an, %ar : %s"
```

Donde tenemos una serie de opciones de formateo: 

| Opción | Descripción de la salida                                 |
| ------ | -------------------------------------------------------- |
| `%H`   | Hash de la confirmación                                  |
| `%h`   | Hash de la confirmación abreviado                        |
| `%T`   | Hash del árbol                                           |
| `%t`   | Hash del árbol abreviado                                 |
| `%P`   | Hashes de las confirmaciones padre                       |
| `%p`   | Hashes de las confirmaciones padre abreviados            |
| `%an`  | Nombre del autor                                         |
| `%ae`  | Dirección de correo del autor                            |
| `%ad`  | Fecha de autoría (el formato respeta la opción `-–date`) |
| `%ar`  | Fecha de autoría, relativa                               |
| `%cn`  | Nombre del confirmador                                   |
| `%ce`  | Dirección de correo del confirmador                      |
| `%cd`  | Fecha de confirmación                                    |
| `%cr`  | Fecha de confirmación, relativa                          |
| `%s`   | Asunto                                                   |


!!!info "Diferencia entre autor y confirmador"
		Puede que te estés preguntando la diferencia entre autor (author) y confirmador (committer). El autor es la persona que escribió originalmente el trabajo, mientras que el confirmador es quien lo aplicó. Por tanto, si mandas un parche a un proyecto, y uno de sus miembros lo aplica, ambos recibiréis reconocimiento —tú como autor, y el miembro del proyecto como confirmador—. 

Las opciones oneline y format son especialmente útiles combinadas con otra opción llamada `--graph`. Ésta añade un pequeño gráfico ASCII mostrando tu historial de ramificaciones y uniones:

```bash
git log --pretty=format:"%h %s" --graph
```

Una manera simplificada de escribir la salida del log: 

```bash
git log --graph --oneline --decorate
```

Finalmente, si deseamos obtener una salida detallada del registo de confirmaciones o de cada _commit_:

```bash
git log --stat
```

Este tipo de salidas serán más interesantes cuando empecemos a hablar sobre [ramificaciones y combinaciones](branches.md).

Éstas son sólo algunas de las opciones para formatear la salida de `git log` (existen muchas más):

| Opción            | Descripción                                                  |
| ----------------- | ------------------------------------------------------------ |
| `-p`              | Muestra el parche introducido en cada confirmación.          |
| `--stat`          | Muestra estadísticas sobre los archivos modificados en cada confirmación. |
| `--shortstat`     | Muestra solamente la línea de resumen de la opción `--stat`. |
| `--name-only`     | Muestra la lista de archivos afectados.                      |
| `--name-status`   | Muestra la lista de archivos afectados, indicando además si fueron añadidos, modificados o eliminados. |
| `--abbrev-commit` | Muestra solamente los primeros caracteres de la suma SHA-1, en vez de los 40 caracteres de que se compone. |
| `--relative-date` | Muestra la fecha en formato relativo (por ejemplo, “2 weeks ago” (“hace 2 semanas”)) en lugar del formato completo. |
| `--graph`         | Muestra un gráfico ASCII con la historia de ramificaciones y uniones. |
| `--pretty`        | Muestra las confirmaciones usando un formato alternativo. Posibles  opciones son `oneline`, `short`, `full`, `fuller` y `format` (mediante el cual  puedes especificar tu propio formato). |


## Filtrar la salida del historial
Es posible aplicar filtros a la información que git mostrará en pantalla mediante el uso de opciones.

### Por tiempo
Podemos mostrar los `n` _commits_ más recientes (donde `n` es un número entero cualquiera): 

```bash
git log -[n]
```

De esta manera, si queremos mostrar los últimos 2 commits realizados: 

```bash
git log -2
```

Existen otras opciones temporales como `--since` (desde) y `--until` (hasta) sí que resultan muy útiles. 

!!! tip "Opciones temporales"
		Este comando acepta muchos formatos. Podés indicar una fecha concreta (`2008-01-15`), o relativa, como `2 years 1 day 3 minutes ago` ("hace 2 años, 1 día y 3 minutos") y muchas opciones más. 

Listar las confirmaciones hechas durante las dos últimas semanas:

```bash
git log --since=2.weeks
```

Listar las confirmaciones hechas desde hace 2 años y 3 meses: 

```bash
git log --since=2.years.3.months.ago
```

Listar las confirmaciones hechas hasta ayer a las 6 am: 

```bash
git log --until="6am yesterday"
```

Listar las confirmaciones hechas hechas desde hace 60 segundos: 

```bash
git log --since=60.seconds.ago
```

Listar las confirmaciones hechas entre fechas específicas: 

```bash
git log --since="2018-04-30", --until="2018-05-03"
```

O listar las confirmaciones realizadas antes de una fecha y hora determinada: 

```bash
git log --until="2018-05-01 03:25:00"
```

El ejemplo anterior, pero ahora empleando otro formato para la fecha y hora: 

```bash
git log --until="Mon May 1 03:25:43 2018"
```


!!!tip "Comandos equivalentes"
		Los comandos `--until` y `--since`, introducidos en versiones de git más recientes, son equivalentes a `--before` y `--after` respectivamente.

### Por autor 

También puedes filtrar la lista para que muestre sólo aquellas confirmaciones que cumplen ciertos criterios. 

La opción `--author` nos permite filtrar por autor. En el ejemplo, _matchean_ los nombres de autor tales como Jorge, José, Jonathan, etc. Podemos especificar el nombre del autor completo, si conocemos el mismo:

```bash
git log --author="Jo"
```

### Por contenido
La opción `--grep` nos permite buscar palabras clave entre los mensajes de confirmación:

```bash
git log --grep="Mensaje del commit a buscar"
```

Otra opción interesante que filtra la salida del historial de confirmaciones teniendo en cuenta el contenido de los archivos de nuestro proyecto: 

```bash
git log -S "Texto a buscar en los archivos de nuestro proyecto"
```

!!!note "Uso de opciones simultáneas"
		Tené en cuenta que si querés aplicar ambas opciones `--author` y  `--grep` simultáneamente, tendrás que añadir la opción `--all-match`. De otro modo, el comando mostrará las confirmaciones que cumplan cualquiera de las dos, no necesariamente las dos a la vez. 