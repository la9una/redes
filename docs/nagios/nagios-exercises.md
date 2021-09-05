
Configurar Nagios a fin de monitorear los siguientes equipos de red:

| Nombre    | IP            | Grupo    | SO      | Variables a monitorear                                       |
| --------- | ------------- | -------- | ------- | ------------------------------------------------------------ |
| router    | 192.168.0.1   | router   | Linux   | ping                                                         |
| ﬁleserver | 192.168.0.126 | torvalds | Linux   | ping, FTP                                                    |
| webserver | 192.168.0.127 | torvalds | Linux   | ping, HTTP, SSH                                              |
| windows   | 192.168.0.230 | gates    | Windows | ping, Espacio en disco C, Estado<br/>del Firewall, Uso de RAM |

Creá los archivos de conﬁguración necesarios en la siguiente ubicación `/etc/nagios4/ejercicio` (deberás crear la carpeta y los archivos)