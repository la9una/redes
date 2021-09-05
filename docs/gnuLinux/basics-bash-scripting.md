Bash es uno de los intérpretes de comandos más populares empleados en sistemas GNU/Linux. Además, consituye en sí mismo un lengua de programación con el que es posible desarrollar scripts para automatizar todo tipo de tareas. 


<div style="margin:0 auto; text-align:center;" >
<img src="../imgGNULinux/bash.png" alt="Linux Bash">
</div>


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

## Ejemplos
Hé aquí algunos ejemplos de las cosas que se pueden hacer con Bash. Por supuesto, no trata de ser una muestra exhaustiva, solo ilustrativa. Disponemos de una basta información en internet con [guías y manuales de uso](https://devdocs.io/bash/).


### Hola mundo
```bash
#!/bin/bash
echo "Hola mundo!"
```

### Verificar si el usuario es root

```bash
#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi
```

### Verificando la existencia de un directorio antes de crearlo

```bash
#!/bin/bash
echo "Enter directory name"
read ndir
if [ -d "$ndir" ]
then
echo "Directory exist"
else
`mkdir $ndir`
echo "Directory created"
fi
```

### Fecha actual

```bash
#!/bin/bash
Year=`date +%Y`
Month=`date +%m`
Day=`date +%d`
Hour=`date +%H`
Minute=`date +%M`
Second=`date +%S`
echo `date`
echo "Current Date is: $Day-$Month-$Year"
echo "Current Time is: $Hour:$Minute:$Second"
```