## Usuarios y permisos
| Tipo de usuario | UID    | Ejemplos                                                     | Características                                              |
| --------------- | ------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| Superusuario    | 0      | root                                                         | Acceso total a todos los directorios, archivos y configuraciones del sistema |
| Especiales      | 1-100  | Cuentas del sistema: bin, daemon, shutdown, mail, squid, apache, entre otras | Poseen privilegios de superusuario restringidos. No poseen contraseñas (nologin) y generalmente se crean al momento de instalación del sistema o aplicaciones |
| Normales        | 1000-* | Cuentas de usuario: juan, pedro, florencia                   | Tienen privilegios completos sólo dentro de su directorio ´home´ |

[Descargar documento](usuariosPermisos.pdf).