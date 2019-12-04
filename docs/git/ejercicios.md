Ejercicios de práctica sobre git, el popular software de control de veriones. 

## Recuperatorio

!!!warning "Importante"
		Antes de continuar con el ejercicio, el alumno deberá detener su trabajo y esperar que el docente revise el punto 5. 

1. Iniciá sesión con tu cuenta en [gitLab](http://192.168.0.209/users/sign_in):
	1. Indicá tu nombre de usuario al docente.
	2. Agregá un repositorio llamado `recuperatorio` (respetar nombre y minúsculas). 
	3. Agregar al usuario `la9una` como colaborador del repositorio.
2. Creá un repositorio vacío en modo local
	1. Configurá git con tus nombre de usuario y mail
	2. Creá el archivo `.gitignore` y excluí el archivo `recupera4.txt`. 
	3. Creá los archivos `recupera[1-4].txt`, **confirmando los cambios despúes de creá cada archivo** con el texto "Creando el archivo n" (donde "n" deberá ser reemplazado por el número de cada archivo).  
3. A partir de `master`, creá una rama llamada `versionado` e ingresá dentro de ésta.
	1. Creá los archivos `evaluacion1.txt` y `evaluacion2.txt`. Confirmá los cambios por separado. 
4. Publicá los cambios de ambas ramas en el servidor remoto.
5. Esperá a que el profesor clone tu repositorio y realice cambios. 
	2. Traé los cambios de la rama
	3. En el nuevo archivo `README.md` (creado por el profesor) agregá el texto "Editado por -Nombre de alumno-", que será también el texto empleado en la comfirmación. Subí los cambios al servidor.
	4. Agregá las siguientes etiquetas y subilas al servidor: 
		1. `recu1` - Al primer commit, con el texto "Evaluación 1" como mensaje de etiqueta.
		2. `recu2` - Al último commit, con el texto "Evaluación 2" como mensaje de etiqueta
6. Creá una nueva rama llamada `fix`, tomando como origen la rama `master`, a partir del _commit_ en el que interviene el profesor. 
	1. Escribí dentro del archivo `README.md` el texto "Rama fix creada", usando el mismo texto para la confirmación. Guardá los cambios en el servidor.     


!!!fail "creá contenido de archivos desde la terminal git en Windows"
		Es posible que al editar un archivo en Windows usando la terminal de git nos aparezca un error, puesto que Windows y Lunux gestionan de manera diferente el contenido de los mismos. En ese caso, ejecutar:
	
		```
		git config --global core.autocrlf true
		```

## Evaluación

!!!warning "Importante"
		Antes de continuar con el ejercicio, el alumno deberá detener su trabajo y esperar que el docente vise los puntos:

		* 2.c. 
		* 4
		* 7.a.  

1. Iniciá sesión con tu cuenta en [github.com](https://github.com/login):
	1. Indicá tu nombre de usuario al docente.
	2. Agregá un repositorio llamado `eval` (respetar nombre y minúsculas). 
	3. Agregar al usuario `la9una` como colaborador del repositorio.
2. Creá un repositorio vacío en modo local
	1. Configurá git con tus nombre de usuario, mail y servidor proxy
	2. Creá el archivo `.gitignore` y excluí el archivo `master4.txt`. 
	3. Creá los archivos `master[1-4].txt`, **confirmando los cambios despúes de creá cada archivo** con el texto "Creando el archivo n" (donde "n" deberá ser reemplazado por el número de cada archivo).  
3. Creá una rama llamada `evaluacion` e ingresá dentro de ésta.
	1. Creá el archivo `evaluacion1.txt` y confirmarlo. 
4. Publicá los cambios de ambas ramas en el servidor remoto.
5. Fusioná la rama `evaluacion` con la rama `master`, incluyendo el texto "Fusionando rama evaluacion con la rama master" como texto del _commit_.
6. Eliminá la rama `evaluacion` en modo local y remoto
7. Ubicate en la rama `master`:
	1. Esperá a que el profesor clone tu repositorio y realice cambios. 
	2. Traé los cambios de la rama
	3. En el nuevo archivo `README.md` (creado por el profesor) agregá el texto "Editado por -Nombre de alumno-", que será también el texto empleado en la comfirmación. Subí los cambios al servidor.
	4. Agregá las siguientes etiquetas y subilas al servidor: 
		1. `evalua0.1` - Al primer commit, con el texto "Evaluación 1" como mensaje de etiqueta.
		2. `evalua1.2` - Al último commit, con el texto "Evaluación 2" como mensaje de etiqueta
8. Creá una nueva rama llamada `prueba`, tomando como origen la rama `master`, a partir del _commit_ en el que interviene el profesor. 
	1. Escribí dentro del archivo `README.md` el texto "Rama prueba creada", usando el mismo texto para la confirmación. Guardá los cambios en el servidor.     


!!!fail "creá contenido de archivos desde la terminal git en Windows"
		Es posible que al editar un archivo en Windows usando la terminal de git nos aparezca un error, puesto que Windows y Lunux gestionan de manera diferente el contenido de los mismos. En ese caso, ejecutar:
	
		```
		git config --global core.autocrlf true
		```

## Simulacro de examen

!!!warning "Importante"
		Antes de continuar con el ejercicio, el alumno deberá detener su trabajo y esperar que el docente vise los puntos 8 y 12. 

1. creá un repositorio vacío en modo local
2. Configuar git con tus nombre de usuario, mail y servidor proxy
3. En la rama `master`, 
	1. creá el archivo `test1.txt`, `test2.txt` confirmando los cambios en cada caso. 
	2. creá tres archivos: `test3.txt`, `test4.txt` y `.gitignore` e incluir en este último al archivo `test3.txt`.  
	3. Confirmar los cambios.
4. creá 2 ramas llamadas `personal` y `feature`
5. En la rama `personal`, creá el archivo `test5.txt` y confirmarlo.
6. En la rama `master`, agregar el texto "Apellido y nombre" al archivo `test1.txt`. Confirmar los cambios.
7. Iniciá sesión con tu cuenta en [github.com](https://github.com/login):
	1. Indicar tu nombre de usuario al docente.
	2. Agregar un repositorio remoto llamado `repotest`. 
	3. Agregar al usuario `la9una` como colaborador del repositorio.
8. Subir las ramas locales al servidor
9. Fusionar la rama `personal` con la rama `master`, incluyendo el texto "Fusionando rama personal con master" como texto del _commit_.
10. Eliminar la rama `personal` en modo local y remoto
11. Esperar por los cambios que realizará el docente en la rama `master`. Luego: 
	1. Traer los cambios de la rama `master`
	2. Resolver los conflictos generados, agregando el texto "Conflicto resuelto por -Nombre de alumno-" dentro del archivo `test1.txt` y al mensaje del _commit_. Confirmar y subir los cambios al servidor.
12. A partir de la rama `master`, creá una nueva rama llamada `fix` tomando como origen el segundo commit.   
13. Agregar el archivo `parche.txt` y confirmar los cambios. Subir los cambios al servidor. 
14. Agregar las etiquetas y subirlas al servidor: 
	1. `v1` - Al primer commit, con el texto "Versión 1 Liberada" como mensaje de etiqueta.
	2. `v1.1` - Al último commit, con el texto "Versión 1.1 Liberada" como mensaje de etiqueta

!!!fail "creá contenido de archivos desde la terminal git en Windows"
		Es posible que al editar un archivo en Windows usando la terminal de git nos aparezca un error, puesto que Windows y Lunux gestionan de manera diferente el contenido de los mismos. En ese caso, ejecutar:
	
		```
		git config --global core.autocrlf true
		```