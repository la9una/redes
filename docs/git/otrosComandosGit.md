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
