## Simulacro de examen

1. Crear un repositorio vacío en modo local
2. Configuar git con tus nombre de usuario, mail y servidor proxy
3. En la rama `master`, crear el archivo `test1.txt`, `test2.txt` y `test3.txt`. Confirmar después de cada creación de archivo.
4. Crear 2 ramas llamadas `personal` y `compartida`
5. En la rama `personal`, crear el archivo `test4.txt` y confirmarlo.
6. En la rama `compartida` crear el archivo `test5.txt`, agregar el texto "Apellido y nombre". Confirmar los cambios.
7. En [github.com](https://github.com/login):
	1. Indicar nombre de usuario al docente.
	2. Agregar un repositorio remoto llamado `repotest`. 
	3. Agregar al usuario `la9una` como colaborador del repositorio.
8. En local, cambiar el nombre del origen remoto por `repotest`
9. Subir las ramas locales al servidor
10. Fusionar la rama `personal` con la rama `master`
11. Eliminar la rama `personal` en modo local y remoto
12. Esperar por los cambios que realizará el docente en la rama `compartida`. Traer los cambios de la rama `compartida` y resolver los conflictos (agrega el texto "Conflicto resuelto"). Confirmar y subir los cambios al servidor.
13. A partir de la rama `master`, crear una nueva rama llamada `fix` tomando como origen el segundo commit.   
14. Agregar el archivo `parche.txt` y confirmar los cambios. Subir los cambios al servidor. 
15. Agregar las etiquetas y subirlas al servidor: 
	1. `v1` - Al primer commit
	2. `v1.1` - Al último commit 

!!!tip "Importante"
		Antes de continuar con los puntos siguientes, el alumno deberá mostrar al docente los puntos 8, 9