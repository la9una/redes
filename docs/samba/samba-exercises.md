## Ejercicio 1
* Creá los siguientes usuarios: **uno** y **dos**. 
* Creá una carpeta compartida para cada usuario, la cual, sólo pueda ser accedida por su dueño. 

## Ejercicio 2

La pyme ficticia "El Trigal" elabora diferentes tipos de panificados. Su personal es pequeño y los mismos comparten carpetas según su área de desempeño: 

| Usuario     |Área de desempeño          | Acceso|
| ---------------------- | -------------- | -------------- |
| jose  | Gerencia|A la carpeta **gerencia** y a cualquier carpeta|
| sol | Administracion |A la carpeta compartida **administracion** y a la carpeta **publica**|
| mia | Administracion |A la carpeta compartida **administracion** y a la carpeta **publica**|
| pedro | Taller |A la carpeta compartida **taller** y a la carpeta **publica**|
| roberto | Taller |A la carpeta compartida **taller** y a la carpeta **publica**|
| juan | Taller |A la carpeta compartida **taller** y a la carpeta **publica**|

## Procedimiento para resolver el ejercicio

**En GNU/Linux**

1. [Instalando Samba](samba-install.md)
2. [Creando usuarios](samba-manage-users/#creacion-de-usuarios-en-gnulinux)
3. [Creando grupos](samba-manage-users/#creacion-de-grupos-en-gnulinux)
4. [Agregando usuarios a los grupos](samba-manage-users//#agregando-usuarios-a-un-grupo-en-gnulinux)
5. [Agresando usuarios a Samba](samba-manage-users//#agregando-usuarios-al-servidor-samba)
6. [Creando carpetas](samba-share-group/#creando-la-carpeta-a-compartir)
7. [Cambiando el usuario y grupo dueño de la carpeta](samba-share-group/#modificando-el-usuario-y-grupo-propietario-de-la-carpeta)
8. [Cambiando los permisos de las carpeta](samba-share-group/#modificando-los-permisos-de-la-carpeta)
9. [Configuración de Samba para carpeta grupal](samba-share-group/#modificando-el-archivo-de-configuracion-de-samba)
10. [Configuración de Samba para carpeta anónima](samba-share-guest.md)
11. [Reiniciando el servidor Samba](samba-share-group/#reiniciando-el-servidor)

**En Windows**

12. [Creando usuarios](samba-manage-users/#creacion-de-usuario-en-windows-7)
13. [Verfificando carpetas compartidas](samba-windows-client.md)