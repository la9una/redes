Tal vez se trate de una discusión eterna entre usuarios de computadoras: Escritorio vs Terminal. Lo cierto es que el empleo de un entorno de escritorio o _desktop_ (GUI - Graphical User Interface) no tiene porqué rivalizar con el uso de una terminal de comandos  o _shell_ (CLI - Command Line Interface). Pueden usarse a la vez, o bien, elegir trabajar de una manera por encima de la otra. 

Veamos un esquema de la arquitectura de sistemas basados en GNU/Linux:

<div style="margin:0 auto; text-align:center;" >
<img src="../imgGNULinux/linux-architecture.jpg" alt="Linux architecture">
  <figcaption>Arquitectura de un sistema GNU/Linux</figcaption>
</div>

Como se puede apreciar, el entorno gráfico (GUI) se encuentra totalmente aislado de la consola de comandos (CLI). Por tanto, en sistemas basados en GNU/Linux podemos prescindir absolutamente del entorno gráfico para operar en el sistema, a diferencia de otros sistemas como Microsoft Windows en donde el entorno de escritorio forma parate del _kernel_ del sistema. 

Hechas las aclaraciones, cabe resaltar que en ambientes de administradores de sistemas y desarrollo se prefiere el uso de la terminal para gestionar las tareas del sistema. Y esto es así por diversas razones: 

* Las órdenes de consola están estandarizadas [(POSIX)](https://es.wikipedia.org/wiki/POSIX) independientemente de la versión del sistema operativo
* Ahorro de recursos (procesador, memoria, etc)
* Fácil automatización de tareas
* Mayor velocidad y eficencia en la gestión de tareas

{==

:octicons-terminal-24: Por lo antedicho, en la presente documentación, nos enfocaremos en la administración de sistemas GNU/Linux mediante la terminal de comandos. 

==}



## Terminales online con GNU/Linux
A continuación se listan VPS (_virtual private server_) que dan acceso al sistema a través de la terminal

* [copy.sh](https://copy.sh/v86/?profile=linux26)
* [JSLinux](https://bellard.org/jslinux/)
* [JS/UNIX](https://www.masswerk.at/jsuix/index.html)
* [webminal.org](http://www.webminal.org) (requiere registro gratuito)
* [Linux Container](https://linuxcontainers.org/lxd/try-it/) (acceso gratuito durante 30 miunutos)



## Intérpretes Bash
Para probar nuestros scripts y aprender Bash

* [Bash Online](https://paiza.io/en/projects/new?language=bash)
* [JDoodle](https://www.jdoodle.com/test-bash-shell-script-online/)
* [Learn Shell](https://www.learnshell.org/)
* [tutorialspoint.com](https://www.tutorialspoint.com/unix_terminal_online.php)
* [ShellCheck](https://www.shellcheck.net/)

