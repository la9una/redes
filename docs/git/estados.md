Una de las grandes ventajas de git es el modo en que gestiona los cambios realizado en los diferentes recursos de nuestro proyecto. 

## Los cuatro estados de un proyecto en git
Las modificaciones que hacemos a nuestro proyecto pueden estar en 4 estados distintos:

###1. Sin seguimiento (_untracked_) 
Son los archivos que nunca fueron agregados al repositorio. Por ejemplo, cuando agrego archivos nuevos a mi proyecto.

Ejemplo de salida: 

```
Untracked files:
index.html
```

###2. Modificado (_modified_)
Las modificaciones todavı́a no están marcadas como _staged_. Por ejemplo, cuando realizo modificaciones en archivos o carpetas que git "sigue".

Ejemplo de salida: 

```
Changes not staged for commit:
modified: index.html
```

###3. Preparado (_staged_)
Las modificaciones están en _staged_ e irán en la próxima confirmación de cambios (_commit_). Por ejemplo, cuando agrego las modificaciones realizadas a los archivos o carpetas de mi proyecto con el comando `add`.

Ejemplo de salida: 

```
Changes to be committed:
new file: index.html
```

###4. Confirmado (_committed_)
Las modificaciones están guardadas con un mensaje que explica los cambios realizados. Por ejemplo, el estado de los archivos y carpetas de mi proyecto una vez que realicé un _commit_.

Ejemplo de salida: 

```
nothing to commit, working directory clean
```

## Las tres secciones de un proyecto git
Lo antes dicho nos lleva a las tres secciones principales de un proyecto de Git: 

![Flujo de trabajo local en Git](imgGit/gitFlujoTrabajoLocal.png)

###1. El directorio de trabajo (_Working directory_) 
Es una copia de una versión del proyecto. Estos archivos se sacan de la base de datos comprimida en el directorio de Git, y se colocan en disco para que los puedas usar o modificar.

###2. El área de preparación (_Staging area_)
Es un archivo, generalmente contenido en tu directorio de Git, que almacena información acerca de lo que va a ir en tu próxima confirmación. A veces se le denomina índice (“index”), pero se está convirtiendo en estándar el referirse a ella como el área de preparación.

###3. El directorio de Git (_Git directory_) 
Es el lugar donde se almacenan los metadatos y la base de datos de objetos para tu proyecto. Es la parte más importante de Git, y es lo que se copia cuando clonas un repositorio desde otra computadora.

###Resumiendo 

| Secciones             | Estado de los archivos | Descripción                              |
| --------------------- | ---------------------- | ---------------------------------------- |
| Directorio de trabajo | Modificado (_modified_)             | Archivos modificados que aún no forman parte del repositorio                    |
| Área de preparación   | Preparado (_staged_)              | Archivos modificados que están listos para formar parte del repositorio |
| Directorio Git        | Confirmado (_committed_)       | Archivos que forman parte del repositorio |

