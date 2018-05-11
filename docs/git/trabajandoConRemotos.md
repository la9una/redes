Como se mencionó con anterioridad, la mayoría de las acciones de Git se efectúan de manera local, en la máquina del cliente. Sin embargo, podemos **sincronizar los archivos de nuestro repositorio local con un repositorio remoto**. Para ello debemos agregar la dirección del servidor o ubicación física (si se trata de un repositorio local) del repositorio con el cual deseamos sincronizar nuestro repositorio. 

Podemos encontrarnos frente a dos situaciones: 

a. Hemos creado nuestro **repositorio local "desde cero"** y deseamos vincularlo con un repositorio remoto. En ese caso, necesariamente tendremos que seguir los pasos descriptos en esta guía. 

b. Nos encontramos trabajando localmente sobre un **repositorio que hemos clonado** desde un repositorio remoto. En ese caso, nuestro repositorio local ya poseerá un origen remoto (que será la dirección del repositorio remoto que clonamos en nuestra computadora). No obstante, de manera opcional, podemos agregarle otros origenes remotos con los que deseemos sincronizar, siguiendo los pasos descriptos en esta guía.

!!!done "Repositorios remotos"
		Un repositorio remoto no es más que un servidor que soporta el trabajo con git. Podemos instalar nuestro propio servidor en la nube, o bien crear una cuenta en algún servidor hospedado: 

		* [Bitbucket](https://bitbucket.org/account/signin/)
		* [GitHub](https://github.com/login)
		* [GitLab](https://gitlab.com/users/sign_in)

## 1. Agregando un origen remoto

Si quisieramos **sincronizar nuestro repositorio local con un repositorio remoto**, primero deberíamos agregar el origen remoto, es decir, la dirección del servidor remoto con el que deseamos sincronizar nuestros archivos. Cabe aclarar que para poder realizar esta acción el administrador del repositorio remoto debe habernos otorgados los permisos correspondientes. 

La sintaxis general para realizar esta acción es: 

```bash
git remote add [nombreRepositorioRemoto] [urlRepositorioRemoto]
```
Donde:

* `[nombreRepositorioRemoto]` Es el nombre del origen remoto (comunmente _origin_ aunque puede ser cualquier otro)
* `[urlRepositorioRemoto]` Es la dirección URL o ruta hacia el repositorio remoto que deseamos vincular

### 1.1. Agregando repositorio remoto [SSH]
```bash
git remote add origin usuario@192.168.0.200:/home/usuario/miRepositorio.git
```
Donde:

* `origin` es el nombre que le asignamos al repositorio remoto
* `usuario` es el nombre de usuario en el servidor remoto.
* `192.168.0.200` es la dirección IP (o nombre de dominio) del servidor remoto. 
* `/home/usuario/miRepositorio.git` es la ruta donde se ubica el repositorio en el servidor remoto.

### 1.2. Agregando repositorio remoto [HTTPS]
```bash
git remote add origin https://github.com/usuario/repositorio.git
```
Donde:

* `origin` es el nombre que le asignamos al repositorio remoto
* `https://github.com` el el nombre de dominio del servidor remoto.
* `usuario` es el nombre de usuario en el servidor remoto.
* `repositorio.git` es el nombre repositorio en el servidor remoto.

## 2. Visualizar orígenes remotos
Para ver los remotos que tenemos configurados, debemos ejecutar:

```bash
git remote
```
Dicho comando **mostrará los nombres de cada uno de los remotos que tenemos especificados**. Si hemos clonado un repositorio, deberíamos ver al menos _origin_ (origen, en inglés); este es el nombre que por defecto Git le da al servidor del que has clonado.

También podemos pasar la opción -v, la cual **muestra las URLs que Git ha asociado al nombre del remoto** y que serán usadas al leer y escribir en ese remoto:

```bash
git remote -v
```

Si tenemos más de un origen remoto, el comando los listará todos. 

!!!fail "Remote name already exists"
		Frente a este posible error común, podemos elegir entre las siguiente soluciones: 

		1. [Usando un nuevo nombre para el origen remoto](trabajandoConRemotos/#32-asignando-un-nuevo-nombre-para-un-remoto)
		2. [Renombrando el origen remoto](trabajandoConRemotos/#31-modificando-el-nombre-de-un-remoto)
		3. [Eliminando el origen remoto](trabajandoConRemotos/#4-eliminando-un-origen-remoto)

## 3. Modificando un origen remoto

Podemos modificar tanto el nombre de un remoto (es decir, su alias) así como la dirección URL del mismo. 


### 3.1. Modificando el nombre de un remoto

Si queremos cambiar el nombre de un remoto (alias) tendremos que recurrir al siguiente comando: 

```bash
git remote rename [nombreRepositorioRemotoViejo] [nombreRepositorioRemotoNuevo]
```

Por ejemplo, si quisiésemos cambiar el nombre de un repositorio remoto llamado "origin" a "juan", lo haremos de la siguiente manera: 

```bash
git remote rename origin juan
```
Es importante destacar que al hacer esto también cambiamos el nombre de las ramas remotas. Por lo tanto, lo que antes estaba referenciado como origin/master ahora lo está como juan/master.

!!!done "El nombre _origin_"
		Por defecto, Git emplea el nombre _origin_ para referirse al origen remoto cada vez que clonamos un repositorio. Esto constituye una conveción y, por lo tanto, podemos cambiarlo por otro nombre si así lo deseamos.

### 3.2. Asignando un nuevo nombre para un remoto
Existe otra manera -tal vez menos elegante- de modificar el nombre de un remoto. Teniendo en cuenta que hemos agregado un origen remoto de la siguiente manera: 

```bash
git remote add origin git@github.com:usuario/repositorio.git  
```
Podemos modificar el nombre del remoto por otro: 

```bash
git remote add [nuevoNombreRepositorioRemoto] git@github.com:usuario/repositorio.git  
```

### 3.3. Modificando la URL de un remoto

Otra opción posible es modificar la URL del repositorio remoto según: 

```bash
git remote set-url [nombreRepositorioRemoto] [nuevaURL]
```
Por ejemplo: 

```bash
git remote set-url origin https://github.com/usuario/repositorio.git
```

## 4. Eliminando un origen remoto
Si por alguna razón queremos eliminar eliminar un remoto -ya sea que hemos cambiado de servidor o no queremos seguir utilizando un mirror, o quizás un colaborador a dejado de trabajar en el proyecto- podemos eliminar el origen remoto ateniéndonos a la siguiente sintaxis del comando:

```bash
git remote rm [nombreRepositorioRemoto] 
```
Por ejemplo: 

```bash
git remote rm miapp
```

## 5. Recibiendo desde nuestros repositorios remotos
Existen dos maneras de recibir contenido desde un repositorio remoto: 

1. Mediante la combinación de los comandos `fetch` y `merge`
2. Mediante el comando `pull`

![Diferencia entre fetch-merge y pull](imgGit/fetchMergePull2.png)

_Diferencia entre fetch-merge y pull_

### 5.1. `fetch` y `merge`
Para recuperar datos de tus repositorios remotos podemos ejecutar:

```bash
$ git fetch [nombreRepositorioRemoto] [rama]
```

Este comando recupera todos los datos del proyecto remoto que no tengamos todavía.

Si clonamos un repositorio, el comando añade automáticamente ese repositorio remoto con el nombre de "origin". Por tanto, el comando: 

```bash
git fetch origin master
```
Recupera toda la información enviada a ese servidor desde que lo clonamos (o desde la última vez que ejecutamos `fetch`). 

!!!warning "Uso del comando `fetch`"
		Es importante tener en cuenta que el comando `fetch` sólo recupera la información y la pone en nuestro repositorio local. **No la une automáticamente con nuestro trabajo ni modifica aquello en lo que estamos trabajando**. 

Estaremos en condiciones de verificar manualmente las diferencias. Para **fusionar los cambios descargados desde el repositorio remoto con nuestro repositorio local**, deberemos ejecutar: 

```bash
git merge origin/master
```

### 5.2. `pull`
Existe otra comando que combina, de una vez, las acciones de los comandos `fetch` y `merge`: el comando `pull`: 

```bash
git pull [nombreRepositorioRemoto] [rama]
```

Al ejecutar `git pull`, por lo general se recupera la información del servidor remoto que clonamos, y automáticamente se intenta unir con el código con el que estamos trabajando actualmente.

!!!fail "Error al intentar fusionar repositorios de orígenes diferentes"
		Si creamos un repositorio local y agregamos un origen (repositorio) externo, al intentar fusionar datos entre ambos obtendremos el siguiente error: 

		`fatal: refusing to merge unrelated histories` 

		Esto es así porque de forma predeterminada, los comandos de fusión de git, como `merge` y `pull` se niegan a fusionar historias que no comparten un antecesor común (es decir, se niegan a fusionar historias de dos proyectos que comenzaron sus vidas de forma independiente). Sin embargo, existe una opción para anular esta medida de seguridad: `--allow-unrelated-histories`. Entonces, si queremos ejecutar el comando `pull` lo haremos de la siguiente manera:

		`git pull [nombreRemoto] [rama] --allow-unrelated-histories`

### 5.3. Resolución de conflictos
En múltiples instancias del flujo de trabajo con git podemos encontrarnos con la situación de resolver un conflicto de forma manual (por ejemplo, cuando poseemos dos versiones del mismo archivo). 

Cada vez que estemos frente a un conclicto, git nos avisará insertando código que nos indicará los fragmentos de código afectados:

```bash
<<<<<<< HEAD
     
[Código en nuestro repositorio local] 
 
=======
     
[Código en el repositorio remoto] 
 
>>>>>>> [rama actual o número de commit]
```

Para resolver esta situación tendremos que: 

1. Decidir cómo quedará el fragmento de código que mantendremos y borrar el resto
2. Borrar los comentarios introducidos automáticamente por git, es decir `<<<<<<< HEAD`, `=======` y `>>>>>>> [rama actual o número de commit]`
3. Guardar el archivo y agregar los cambios (`add`)
4. Realizar la confirmación o _commit_
5. Enviar los cambios al servidor remoto

## 6. Enviando hacia nuestros repositorios remotos

Cuando tu proyecto se encuentra en un estado que deseamos compartir, tenemos que enviarlo a un repositorio remoto. El comando que nos permite hacer esto es sencillo: 

```bash
git push [nombreRepositorioRemoto][rama]
```

Por ejemplo, si queremos enviar nuestra rama (master) a nuestro servidor remoto (origin), ejecutaríamos el siguiente comando:

```bash
$ git push origin master
```

!!!fail "Error al intentar realizar `git push`"
		Puede ocurrir que otro desarrollador esté trabajando en el mismo archivo que nosotros y actualice el repositorio remoto antes que nosotros. En ese caso, al intentar hacer un `git push` obtendremos un error similar a este: 

		```bash
		error: failed to push some refs to 'xxx@yyy'
		hint: Updates were rejected because the remote contains work that you do
		hint: not have locally. This is usually caused by another repository pushing
		hint: to the same ref. You may want to first integrate the remote changes
		hint: (e.g., 'git pull ...') before pushing again.
		hint: See the 'Note about fast-forwards' in 'git push --help' for details.
		```
		En primer lugar, tendremos que "bajarnos" el trabajo de la otra persona:
	
		```bash
		git pull [nombreRepositorioRemoto] [rama]
		```
		
		Para luego, poder realizar el envío de nuestros cambios al repositorio remoto: 

		```bash
		git push [nombreRepositorioRemoto] [rama]
		```
		
