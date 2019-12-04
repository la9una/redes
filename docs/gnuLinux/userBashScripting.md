## Creando scripts
La terminal de GNU/Linux, en la mayoria de las distribuciones, emplea BASH un emulador de terminal que posee su propio lenguaje de programación, denominado _Bash scripting_. 

Para crear un script bastará con seguir los siguientes pasos: 

[1.] Crear un archivo de texto

[2.] Dentro del archivo, incluir el siguiente encabezado:

```bash
#!/bin/bash
```

[3.] Seguidamente, agregar los comandos que se deseen ejecutar. Hay muchas maneras de hacer esto, aunque la recomendada para comenzar es colocar un comando por línea, es decir, uno debajo del otro. 


[4.] Una vez guardados los cambios, en necesario dar permisos de ejecución al archivo, de la siguiente manera: 

```bash
chmod +x nombreScript
```

[5.] Finalmente, estaremos en condiciones de ejecutar el script: 

```
sh nombreScript
```

o bien

```
./nombreScript
```
