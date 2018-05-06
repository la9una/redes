# Ignorando archivos o carpetas
Suele ocurrir que no desees que git realice el seguimiento de ciertos archivos o carpetas, ya sea porque son archivos generados automáticamente, como archivos de log, o archivos generados por tu compilador. 

Para estos casos podés crear un archivo llamado `.gitignore` en la raíz de la carpeta de nuestro proyecto, en el que podrás incluir una lista de dichos recursos. 

Las reglas para crear un archivo `.gitignore` son:

* Las líneas en blanco, o que comienzan por #, son ignoradas.
* Podés utilizar [expresiones regulares](https://es.wikipedia.org/wiki/Expresi%C3%B3n_regular) estándar.
* Podés excluir un directorio añadiendo una barra (/) al final del nombre del mismo.
* Podés negar un patrón añadiendo una exclamación (!) al principio.

## Ejemplo de archivo `.gitignore`
Existen infinidad de maneras de escribir el contenido de un archivo `.gitignore` dependiendo, claro está, de las necesidades del usuario. Con todo, un ejemplo de este archivo podría ser el siguiente:

```bash
# Las líneas que comienzan con (#) son consideradas comentarios 
# por tal motivo, no son tenidas en cuenta por git

# Ignorar todos los archivos con la extensión .a
*.a

# Ignorar todos los archivos con la extensión .a
# exceptuando al archivo lib.a
!lib.a

# Sólo ignora el archivo ubicado en la raíz llamado TODO
# no ignora el subdirectorio llamado /TODO
/TODO

# Ignorar todos los archivos en el directorio build/ 
build/

# Ignorar doc/notes.txt, pero no doc/server/arch.txt
doc/*.txt

# Ignorar todos los archivos con extensión .txt files en el directorio doc/
doc/**/*.txt

```



## Uso de expresiones regulares
En el ejemplo anterior se puede apreciar el uso de expresiones regulares como se explicó mas arriba. Podemos ampliar más este concepto, apelando a otro ejemplo: 

```bash
*.[abc]
[0-9].*
*.htm?
*~
```

Donde: 

* Un asterisco `(*)` reconoce cero o más caracteres

* La primera línea le dice a Git que ignore cualquier archivo cuyo nombre termine en el patrón `[abc]`, es decir a, b o c

* La segunda línea indica que se excluyan archivos de cualquier extensión que empiecen con un número de 0 a 9

* Una interrogación `(?)` reconoce un único carácter. Por tanto, la tercer línea excluye cualquier archivo que temine con la extensión .htm(algo)

* La cuarta línea le dice a Git que ignore todos los archivos que terminan en tilde `(~)`, usada por muchos editores de texto, como Emacs, para marcar archivos temporales. 


!!!tip "El archivo `.gitignore`"
		Configurar un archivo `.gitignore` antes de empezar a trabajar suele ser una buena idea, a fin de no confirmar archivos que no queremos "controlar" en nuestro repositorio Git.

