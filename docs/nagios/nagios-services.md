En este paso definiremos qué parámetros vamos a monitorear. Para ello, abriremos el archivo `servicios.cfg` creado con anterioridad: 

```bash
sudo vim /etc/nagios4/objetos/servicios.cfg
```

En el archivo, **tendremos que agregar los servicios que deseemos monitorear** en los equipos. 


## Monitoreando servicios en GNU/Linux

Por ejemplo, podríamos **monitorear en un servidor GNU/Linux**, el estado del **servidor web**, **ftp** y **ssh**: 

```apache
#######################
# Servicios genéricos #
#######################

### Ping ###
define service {
use						generic-service
hostgroup_name			sala1
service_description		Comprobando conectividad
check_command			check_ping!200.0,20%!600.0,60%
normal_check_interval	5
retry_check_interval	1
} 

### Estado del servidor web ###
define service{
use						generic-service
hostgroup_name			sala1
service_description		Estado del protocolo HTTP
check_command			check_http
}

### Estado del servidor FTP ###
define service{
use						generic-service		
hostgroup_name			sala1
service_description		Estado del protocolo FTP
check_command			check_ftp
}

### Estado del servidor SSH ###
define service{
use						generic-service
hostgroup_name			sala1
service_description		Estado del protcolo SSH
check_command			check_ssh
}
```

!!!note "Sobre los servicios"
	Los servicios que vamos a monitorear se pueden configurar para:

	* un equipo en particular, mediante la directiva **host_name** o
	
	* para un grupo de equipos empleando la directiva **hostgroup_name**.

Para finalizar, tendremos que [verificar la configuración y reiniciar el servidor Nagios](configuracion/#verificando-la-configuracion-y-reiniciando-nagios) para guardar los cambios que hayamos introducido.

## Monitoreando servicios en Windows

Si ahora, por ejemplo, queremos monitorear un equipo con el **sistema Microsoft Windows**, debermos previamente [instalar y configurar el agente NSClient++](nsclient/#instalacion-de-nsclient) en la máquina Windows que deseamos monitorear:

```apache
####################################
# Servicios en equipos con Windows #
####################################

### Verificando funcionamiento del agente ###
define service {
use						generic-service
hostgroup_name			sala1
service_description		Estado del agente NSClient++
check_command			check_nt!CLIENTVERSION
} 

### Uptime del sistema ###
define service {
use						generic-service
hostgroup_name			sala1
service_description		Uptime
check_command			check_nt!UPTIME
} 

### Uso del CPU ###
define service {
use						generic-service
hostgroup_name			sala1
service_description		Carga del CPU
check_command			check_nt!CPULOAD!-l 5,80,90
} 

### Uso de la memoria RAM ###
define service {
use						generic-service
hostgroup_name			sala1
service_description		Uso de memoria RAM
check_command			check_nt!MEMUSE!-w 80 -c 90
} 

### Espacio disponible en disco C: ###
define service {
use						generic-service
hostgroup_name			sala1
service_description		Espacio en disco C:/
check_command			check_nt!USEDDISKSPACE!-l C -w 80 -c 90
} 

### Espacio disponible en disco F: ###
define service {
use						generic-service
hostgroup_name			sala1
service_description		Espacio en disco F:/
check_command			check_nt!USEDDISKSPACE!-l F -w 90 -c 95
} 

### Estado del Explorador de Windows ###
define service {
use						generic-service
hostgroup_name			sala1
service_description		Proceso: Explorador de Windows
check_command			check_nt!PROCSTATE!-d SHOWALL -l explorer.exe
} 

### Estado del antivirus AVG ###
define service {
use						generic-service
hostgroup_name			sala1
service_description		Proceso: Antivirus AVG
check_command			check_nt!PROCSTATE!-d SHOWALL -l avgrsa.exe
} 

### Estado del protocolo SNMP ###
define service {
use						generic-service
hostgroup_name			sala1
service_description		Servicio: SNMP
check_command			check_nt!SERVICESTATE!-d SHOWALL -l SNMP
} 

### Estado del servicio de Windows Update ###
define service{
use						generic-service
hostgroup_name			sala1
service_description		Servicio: Windows Update
check_command			check_nt!SERVICESTATE!-d SHOWALL -l wuauserv
} 

### Estado del servicio de activación de Windows ###
define service{
use						generic-service
hostgroup_name			sala1
service_description		Servicio: Activacion de Windows
check_command			check_nt!SERVICESTATE!-d SHOWALL -l WatAdminSvc
} 

### Estado del Firewall de Windows ###
define service{
use						generic-service
hostgroup_name			sala1
service_description		Servicio: Firewall de Windows
check_command			check_nt!SERVICESTATE!-d SHOWALL -l MpsSvc
} 
```


Por último, tendremos que [verificar la configuración y reiniciar el servidor Nagios](configuracion/#verificando-la-configuracion-y-reiniciando-nagios) para guardar los cambios que hayamos introducido.

### Agregando monitoreo de estado de servicios

Si quisiésemos agregar el monitoreo del estado de algún servicio en Windows (es decir, saber si se está ejecutando o no) abrimos el diálogo _Ejecutar_ pulsando las teclas `Windows` + `r` y ejecutamos `services.msc`

![Servicios Windows](imgNagios/services_01.png)

Luego, seleccionamos el servicio a monitorear. Por ejemplo, el **Cliente DHCP**. Hacemos clic derecho sobre el mismo y seleccionamos _Propiedades_ del menú contextual

![Servicios Windows](imgNagios/services_05.png)

Tendremos que copiar el nombre del servicio **tal cual**, es decir, respetando las mayúsculas y minúsculas. En este caso, `Dhcp`

![Servicios Windows](imgNagios/services_06.png)

Por último, tendremos que definir el monitoreo del mismo en el archivo `servicios.cfg`, donde sólo tendremos que cambiar la última palabra de la última línea: 

```apache
####################################
# Servicios en equipos con Windows #
####################################

### Verificando funcionamiento del Cliente DHCP ###
define service{
use						generic-service
hostgroup_name			sala1
service_description		Servicio: Cliente DHCP
check_command			check_nt!SERVICESTATE!-d SHOWALL -l Dhcp
} 
```