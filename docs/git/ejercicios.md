## Simulacro de examen

!!!warning "Importante"
		Antes de continuar con el ejercicio, el alumno deberá detener su trabajo y esperar que el docente vise los puntos 8, 9 y 12. 

1. Crear un repositorio vacío en modo local
2. Configuar git con tus nombre de usuario, mail y servidor proxy
3. En la rama `master`, 
	1. Crear el archivo `test1.txt`, `test2.txt` confirmando los cambios en cada caso. 
	2. Crear dos archivos: `test3.txt` `test4.txt` y `.gitignore`. Incluir en este último, al archivo `test3.txt`.  
	3. Confirmar los cambios.
4. Crear 2 ramas llamadas `personal` y `feature`
5. En la rama `personal`, crear el archivo `test5.txt` y confirmarlo.
6. En la rama `feature` crear el archivo `test6.txt`, agregar el texto "Apellido y nombre". Confirmar los cambios.
7. En [github.com](https://github.com/login):
	1. Indicar nombre de usuario al docente.
	2. Agregar un repositorio remoto llamado `repotest`. 
	3. Agregar al usuario `la9una` como colaborador del repositorio.
8. En local, cambiar el nombre del origen remoto por `repotest`
9. Subir las ramas locales al servidor
10. Fusionar la rama `personal` con la rama `master`
11. Eliminar la rama `personal` en modo local y remoto
12. Esperar por los cambios que realizará el docente en la rama `master`. Luego: 
	1. Traer los cambios de la rama `master`
	2. Resolver los conflictos generados, agregando el texto "Conflicto resuelto por -Nombre de alumno-" dentro del archivo `test1.txt` y al mensaje del _commit_. Confirmar y subir los cambios al servidor.
13. A partir de la rama `master`, crear una nueva rama llamada `fix` tomando como origen el segundo commit.   
14. Agregar el archivo `parche.txt` y confirmar los cambios. Subir los cambios al servidor. 
15. Agregar las etiquetas y subirlas al servidor: 
	1. `v1` - Al primer commit
	2. `v1.1` - Al último commit 

!!!fail "Crear contenido de archivos desde la terminal git en Windows"
		Es posible que al editar un archivo en Windows usando la terminal de git nos aparezca un error, puesto que Windows y Lunux gestionan de manera diferente el contenido de los mismos. En ese caso, ejecutar:
	
		```
		git config --global core.autocrlf true
		```