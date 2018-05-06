## Mostrando diferencias

El comando `diff` compara lo que tenemos en el directorio de trabajo con lo que está en el área de preparación:

```bash
git diff
```
Para ver las diferencias existentes entre dos ramas, ejecutamos: 

```bash
git diff [rama1] [rama2]
```


## Renombrar archivos
Podemos renombrar archivos directamente desde Git con el comando

```bash
git mv file_from file_to
```
Este último comando es equivalente a los siguientes pasos:

1. Renombrar el archivo manualmente
2. `git rm` para eliminar el archivo con git.
3. `git add` para agregar el archivo con el nuevo nombre. 


## Ignorando archivos
A menudo tendrás un tipo de archivos que no quieras que Git añada automáticamente o te muestre como no versionado. Suelen ser archivos generados automáticamente, como archivos de log, o archivos generados por tu compilador. Para estos casos puedes crear un archivo llamado .gitignore, en el que listas los patrones de nombres que deseas que sean ignorados. He aquí un archivo .gitignore de ejemplo:

```bash
*.[oa]
*~
```

La primera línea le dice a Git que ignore cualquier archivo cuyo nombre termine en `.o` o `.a` —archivos objeto que suelen ser producto de la compilación de código—. La segunda línea le dice a Git que ignore todos los archivos que terminan en tilde `(~)`, usada por muchos editores de texto, como Emacs, para marcar archivos temporales. También puedes incluir directorios de log, temporales, documentación generada automáticamente, etc. Configurar un archivo `.gitignore` antes de empezar a trabajar suele ser una buena idea, para así no confirmar archivos que no quieres en tu repositorio Git.

Las reglas para los patrones que pueden ser incluidos en el archivo `.gitignore` son:

* Las líneas en blanco, o que comienzan por #, son ignoradas.
* Puedes usar patrones glob estándar.
* Puedes indicar un directorio añadiendo una barra hacia delante (/) al final.
* Puedes negar un patrón añadiendo una exclamación (!) al principio.

Los patrones glob son expresiones regulares simplificadas que pueden ser usadas por las shells. Un asterisco `(*)` reconoce cero o más caracteres; `[abc]` reconoce cualquier carácter de los especificados entre corchetes (en este caso, a, b o c); una interrogación `(?)` reconoce un único carácter; y caracteres entre corchetes separados por un guión `([0-9])` reconoce cualquier carácter entre ellos (en este caso, de 0 a 9).

He aquí otro ejemplo de archivo `.gitignore`:

```bash
# a comment – this is ignored
# no .a files
*.a
# but do track lib.a, even though you're ignoring .a files above
!lib.a
# only ignore the root TODO file, not subdir/TODO
/TODO
# ignore all files in the build/ directory
build/
# ignore doc/notes.txt, but not doc/server/arch.txt
doc/*.txt
# ignore all .txt files in the doc/ directory
doc/**/*.txt
```