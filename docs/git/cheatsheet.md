## 1. Iniciar un repositorio git
Existen dos maneras comenzar a trabajar con git: clonando un repositorio git existente o creando un repositorio git "desde cero".

### a. Clonando un repositorio de git existente
El repositorio debe existir en algún servidor remoto privado o _hosteado_ como, por ejemplo, [Bitbucket](https://bitbucket.org/account/signin/), [GitHub](https://github.com/login) ó [GitLab](https://gitlab.com/users/sign_in).

**HTTPS**

```bash
git clone <urlRepositorioRemoto>
```

### b. Creando un repositorio git "desde cero"
El repositorio no existe, en modo local ni remoto. Para ello, nos introducimos en la carpeta donde tenemos alojado nuestro proyecto (o una carpeta vacía) para comenzar. 

2.1. Inicializamos el repositorio
```bash
git init
```

## 2. Introduciendo cambios en nuestro proyecto
2.1. Añadimos nuevos archivos o realizamos las modificaciones correspondientes a nuestro proyecto

2.2. Agregamos todos los cambios realizados en el paso anterior

```bash
git add .
```
2.3. Confirmamos los cambios
```bash
git commit -m "<Mensaje del commit>"
```

## 3. Agregando origen remoto
Este paso sólo válido si iniciamos un repositorio git "desde cero" (punto 1.b.). En caso que hayamos clonado el repositorio (punto 1.a.), omitir este paso. 

Para poder publicar nuestro repositorio el algún servidor remoto, debemos indicar su ubicación.  

**HTTPS**

```bash
git remote add <nombreRepositorioRemoto> <urlRepositorioRemoto>
```

## 4. Publicando nuestro repositorio
Todos los cambios que hacemos en git se alojan de modo local, es decir, en nuestra computadora. Para publicar nuestras modificaciones en un repositorio externo (remoto) tendremos que realizar algunos pasos adicionales. 

```bash
git push <nombreRepositorioRemoto> <rama>
```



