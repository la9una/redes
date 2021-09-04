# Métodos de compresión y descompresión en Linux

A continuación se listan las herramientas de compresión de línea de comandos más utilizadas en el universo GNU/Linux y el Open Source en general. 

##Archivos .tar

Para poder **empaquetar archivos .tar**, utilizamos el siguiente comando:

```bash
tar -cvf <nombreDeArchivo.tar> <recursoAComprimir>
```
Donde:

| Opciones | Descripción                              |
| -------- | ---------------------------------------- |
| -c       | Indica a tar que cree un archivo         |
| -v       | Indica a tar exhiba en pantalla las acciones realizadas |
| -f       | Indica a tar que el siguiente argumento es el nombre del `nombreDeArchivo.tar` |

Para poder **desempaquetar  archivos .tar**, utilizamos el siguiente comando:

```bash
tar -xvfC <nombreDeArchivo.tar> <ubicacion>
```
Donde:

| Opciones | Descripción                              |
| -------- | ---------------------------------------- |
| -x       | Indica a tar que descomprima el <nombreDeArchivo.tar> |
| -v       | Indica a tar exhiba en pantalla las acciones realizadas |
| -f       | Indica a tar que el siguiente argumento es el nombre del `nombreDeArchivo.tar` |
| -C       | Indica a tar la ruta en la cual desempaquetará el `nombreDeArchivo.tar` |

Si se quiere **ver el contenido de un archivo .tar** (sin abrirlo), se utiliza el siguiente comando:

```bash
tar -tf <nombreDeArchivo.tar>
```
Donde:

| Opciones | Descripción                              |
| -------- | ---------------------------------------- |
| -t       | Lista el contenido del `nombreDeArchivo.tar`       |
| -f       | Indica a tar que el siguiente argumento es el nombre del `nombreDeArchivo.tar` |


##Archivos .gz

Para **comprimir archivos en formato .gz**, se utiliza el siguiente comando:

```bash
gzip -9 <recursoAComprimir>
```
Donde:

| Opciones | Descripción                              |
| -------- | ---------------------------------------- |
| -9       | Le indica a gz que utilice el mayor factor de compresión posible |
| -f       | Indica a tar que el siguiente argumento es el nombre del `nombreDeArchivo.tar` |

Para **descomprimir archivos .gz**, se utilizara el siguiente comando:

```bash
gzip -d <nombreDeArchivo.gz>
```
Donde:

| Opciones | Descripción          |
| -------- | -------------------- |
| -d       | Indica descompresión |


##Archivos .bz2

Para **comprimir archivos en formato .bz2**, se utiliza el siguiente comando:

```bash
bzip2 <recursoAComprimir>
```
Para **descomprimir archivos .bz2**, se usa el comando siguiente:

```bash
bzip2 -d <nombreDeArchivo.bz2>
```
Donde:

| Opciones | Descripción          |
| -------- | -------------------- |
| -d       | Indica descompresión |

>Nota: Tanto el compresor gzip como bzip2, solo comprimen archivos, no directorios, para comprimir directorios (carpetas), se debe de usar en combinación con tar.

##Archivos .tar.gz

Para **comprimir archivos en formato tar.gz**, se utiliza el siguiente comando:

```bash
tar -czvf <nombreDeArchivo.tar.gz> <recursoAComprimir>
```
Donde: 

| Opciones | Descripción          |
| -------- | -------------------- |
| -c       | Indica a tar que cree un archivo |
| -z       | Indica que se use el algoritmo de compresión gzip |
| -v       | Indica a tar exhiba en pantalla las acciones realizadas |
| -f       | Indica a tar que el siguiente argumento es el nombre del `nombreDeArchivo.tar` |

Para **descomprimir archivos con extensión tar.gz**, se usa el siguiente comando:

```bash
tar -xzvf <nombreDeArchivo.tar.gz>
```

Donde: 

| Opciones | Descripción          |
| -------- | -------------------- |
| -x       | Indica a tar que extraiga el contenido del archivo `.tar.gz` |
| -z       | Indica a tar que el archivo está comprimido con el algoritmo de compresión gzip |
| -v       | Indica a tar exhiba en pantalla las acciones realizadas |
| -f       | Indica a tar que el siguiente argumento es el nombre del `nombreDeArchivo.tar` |

Para poder **ver el contenido de un archivo comprimido en .tar.gz** (sin abrirlo), se usa el siguiente comando:

```bash
tar -tzf <nombreDeArchivo.tar.gz>
```

## Archivos tar.bz2

Para **comprimir archivos tar.bz2**, se utiliza el siguiente comando:

```bash
tar cjvf <nombreDeArchivo.tar.bz2> <recursoAComprimir>
```
Donde: 

| Opciones | Descripción          |
| -------- | -------------------- |
| -c       | Indica a tar que cree un archivo |
| -j       | Indica que se use el algoritmo de compresión bzip2 |
| -v       | Indica a tar exhiba en pantalla las acciones realizadas |
| -f       | Indica a tar que el siguiente argumento es el nombre del `nombreDeArchivo.tar` |

Para **descomprimir archivos tar.bz2**, se utiliza el siguiente comando:

```bash
tar xjvf <nombreDeArchivo.tar.bz2>
```
| Opciones | Descripción          |
| -------- | -------------------- |
| -x       | Indica a tar que extraiga el contenido del archivo `.tar.bz2`|
| -j       | Indica a tar que el archivo está comprimido con el algoritmo de compresión bzip2 |
| -v       | Indica a tar exhiba en pantalla las acciones realizadas |
| -f       | Indica a tar que el siguiente argumento es el nombre del `nombreDeArchivo.tar` |

Y para **ver el contenido de un archivo tar.bz2** (sin abrirlo), se usa el siguiente comando:

```bash
bzip2 -dc <nombreDe<nombreDeArchivo.tar>.bz2> | tar -t
```

##Archivos .zip

Para poder **comprimir en formato zip**, se usara el comando siguiente:

```bash
zip <nombreDeArchivo.zip> <recursoAComprimir>
```

Si deseamos proteger con contraseña un archivo comprimido, debemos proceder de esta manera (en el proceso se nos pedirá ingresar la contraseña): 

```bash
zip -re <nombreDeArchivo.zip> <recursoAComprimir>
```
También: 

```bash
zip --encrypt <nombreDeArchivo.zip> <recursoAComprimir>
```
O bien (inseguro) del siguiente modo: 

```bash
zip --password <contraseña> <nombreDeArchivo.zip> <recursoAComprimir>
```

Para poder **descomprimir los archivos zip**, se usa el siguiente comando:

```bash
unzip <nombreDeArchivo.zip>
```

O bien, si queremos descomprimir el contenido del archivo `.zip` en un directorio particular: 

```bash
unzip <nombreDeArchivo.zip> -d <ubicacion>
```

Para descomprimir un archivo o lote de archivos protegidos por **contraseña**, ejecutamos: 

```bash
unzip -P <contraseña> <nombreDeArchivo.zip>
```

Para** ver el contenido de un archivo zip** (sin abrirlo), se pone el siguiente comando:

```bash
unzip -v <nombreDeArchivo.zip>
```

## Archivos .rar

Para **comprimir en formato rar**, se usara el siguiente comando:

```bash
rar -a <nombreDeArchivo.rar> <recursoAComprimir>
```

Una vez creado el archivo comprimido, podemos **protegerlo con contraseña** (se nos pedirá ingresar la misma): 

```bash
rar a -p <nombreDeArchivo.rar>
```

Para **descomprimir archivos en formato rar**, se utiliza el siguiente comando:

```bash
unrar -x <nombreDeArchivo.rar>
```

Para descomprimir un archivo o lote de archivos protegidos por **contraseña**, ejecutamos: 

```bash
unrar x -p<contraseña> <nombreDeArchivo.rar>
```

Para **ver el contenido de un archivo rar** (sin abrirlo), se usa el siguiente comando:

```bash
unrar -v <nombreDeArchivo.rar>
```

O bien, 

```bash
unrar -l <nombreDeArchivo.rar>
```


