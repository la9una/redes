## Deshaciendo cosas en Git
En cualquier momento puedes querer deshacer algo. En esta sección veremos algunas herramientas básicas para deshacer cambios.

### Reenviando una comfirmación (_commit_)
Nos puede ocurrir que confirmamos un cambio antes de tiempo, olvidando agregar alguna modificación, un archivo o nos equivocamos en el mensaje de la confirmación. 

Si deseamos desahacer la confirmación, podemos reconfirmarla con la opción --amend:

```bash
git commit --amend
```
Por ejemplo, si enviamos el _commit_ y luego nos damos cuenta que olvidamos incluir un archivo en el mismo, podemos hacerlo de la siguiente manera: 

```bash
$ git commit -m "Mensaje del commit"
$ git add archivoOlvidado
$ git commit --amend
```

Al final terminaremos con un solo _commit_ (el segundo _commit_ reemplazará al primero)

### Deshacer un archivo preparado (manteniendo las modificaciones)
Puede ocurrir que luego de hacer un _commit_ deseamos editar sólo un arhivo que incluimos en él. 
Para estas ocasiones puede resultar útil el siguiente comando: 

```bash
git reset HEAD [archivo]
```
Por ejemplo: 

```bash
git reset HEAD index.html
```

El archivo `index.html` ahora está modificado y, nuevamente, no preparado.

### Deshacer todos los archivos preparados
Podemos volver atrás todos los cambios incluidos en una confirmación o _commit_, y elegir si deseamos mantener las modificaciones hechas en ella o descartarlas: 

#### Mantener las modificaciones
Existe la posibilidad de eliminar el commit pero manteniendo las modificaciones que contiene ese commit en el área de trabajo. Para ello, ejecutaríamos el siguiente comando:

```bash
git reset HEAD~1
```

Así que podemos seguir trabajando, corregir el bug o completar las modificaciones que habíamos dejado incompletas y hacer un nuevo commit con los cambios completos. 


!!!done "Sintaxis"
		La sintaxis `HEAD~1` del comando anterior la podríamos traducir como “El commit al que está apuntando la rama activa menos uno”. Si hubiésemos ejecutado el comando:

		```bash
		git reset --hard HEAD~3
		```
		
		en lugar de deshacer el último commit deshaceríamos tres commits hacia atrás.

		También, podemos deshacer el commit actual: 

		```bash
		git reset --hard HEAD
		```

		O deshacer el commit inmediato anterior: 

		```bash
		git reset --hard HEAD^

		```

#### Descartar las modificaciones
Supongamos que queremos deshacer el último _commit_ y, además, desechar los cambios introducidos en él. Para ello, ejecutamos el comando:

```bash
git reset --hard HEAD~1
```

Habremos descartado todas las modificaciones hechas antes del último _commit_ incluido éste último. 


### Deshacer un archivo modificado
¿Qué tal si te das cuenta que no querés mantener los cambios del archivo `index.html` del ejemplo anterior? ¿Cómo volver al estado en el que estaba en la última confirmación (o
cuando estaba recién clonado, o como sea que haya llegado a tu directorio de trabajo)? Con la opción `checkout --`:

```bash
git checkout -- index.html
```

De esta manera, el archivo `index.html` volverá al estado que tenía luego del último _commit_


## Volver hacia una confirmción posterior
Git nos permite volver hacia atrás a cualquier _commit_ que forme parte de la historia de nuestro proyecto, deshaciendo los cambios posteriores al commit elegido. Para ello, es suficiente ejecutar el siguiente comando: 

```bash
git checkout [numeroDeHash]
```
Donde `numeroDeHash` es el número de hash del _commit_ al cual deseamos retornar. 

Por ejemplo: 

```bash
git checkout 56a4e5c08
```

!!!done "Obtener número de hash"
		Podemos obtener el número de hash fácilmente con el siguiente comando: 

		```bash
		git log --oneline
		```

Sin embargo, esta acción dejaría al proyecto sin referencia a `HEAD`. Eso significa que podemos hacer cambios y modificaciones sobre el código del momento en el que nos hemos situado y hacer los _commits_ que necesitemos, pero si queremos que esos cambios se mantengan en git y no sean eliminados por el proceso `git garbage collection process` tendremos que crear una nueva rama del último commit que hemos realizado:

```bash
git checkout -b [ramaNueva] [numeroDeHash]
```

Por ejemplo: 

```bash
git checkout -b prueba 56a4e5c08
```
Una vez realizado los cambios necesarios, podremos volver a nuestra rama principal, fusionar la nueva rama con ésta y eliminar la rama que habiamos creado:

```bash
git checkout master && git merge prueba && git branch -d prueba
```

No obstante,si tenemos claro que deseamos volver hacia atrás a un punto concreto del historial descartando todos los cambios posteriores, podemos recurrir al siguiente comando: 

```bash
git reset --hard [numeroDeHash]
```

Por ejemplo: 

```bash
git reset --hard 56a4e5c08
```
De esta manera, nuestro proyecto se encontrará según el _commit_ apuntado. 



## Base de conocimiento
* [http://aprendegit.com/como-deshacer-el-ultimo-commit-en-git](http://aprendegit.com/como-deshacer-el-ultimo-commit-en-git)
* https://pajarokillo.wordpress.com/2015/02/23/deshaciendo-cambios-con-git/
* http://www.7sabores.com/blog/como-revertir-un-push-git
* https://www.atlassian.com/git/tutorials/resetting-checking-out-and-reverting
* https://styde.net/deshaciendo-cosas-en-git/
* https://es.stackoverflow.com/questions/3575/quitar-archivos-a%C3%B1adidos-antes-de-un-commit
* http://rogerdudler.github.io/git-guide/index.es.html
* https://gist.github.com/jelcaf/1404619
* https://es.stackoverflow.com/questions/1458/regresar-un-repositorio-a-un-commit-especifico
* https://loquemeinteresadelared.wordpress.com/2016/03/28/git-cookbook-que-es-el-estado-o-modo-detached-head/#more-877



