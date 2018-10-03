El archivo _hosts_ existe en todos los sistemas operativos. Si bien se puede emplear para la resolución de nombres de dominio en una red local, en redes medianas actualmente es reemplazado por el servicio de DNS. 

!!!info "Wikipedia" 
	El archivo **hosts** de un ordenador es usado por el sistema operativo para guardar la **correspondencia entre dominios de Internet y direcciones IP**. Este es uno de los diferentes métodos que usa el sistema operativo para resolver nombres de dominios. 

	Antiguamente cuando no había servidores DNS que resolvieran los dominios, el archivo hosts era el único encargado de hacerlo, pero dejó de utilizarse cuando Internet empezó a crecer en nombres de dominio, pasando a usar servidores de resolución de DNS. 

	En muchos sistemas operativos este método es usado preferentemente respecto a otros como el DNS. En la actualidad también es usado para bloquear contenidos de Internet como la publicidad web.

##Ubicación del archivo _hosts_
El archivo **hosts** es un archivo de texto plano que puede ser editado por el administrador del equipo y su ubicación depende del sistema operativo:

| Sistema operativo      | Ubicación del archivo _hosts_           |
| ---------------------- | --------------------------------------- |
| Microsoft Windows      | `C:\Windows\System32\drivers\etc\hosts` |
| Unix - GNU/Linux - BSD | `/etc/hosts`                            |
| Mac OS - iPhone OS     | `/private/etc/hosts`                    |
| Android                | `/system/etc/hosts`                     |


Entonces, si deseamos abrir el archivo en **GNU/Linux**, ejecutamos:

```bash
sudo vim /etc/hosts
```

Si en cambio, deseamos abrir el archivo en **Microsoft Windows**, haremos clic derecho sobre el archivo **hosts** (ver ubicación en la tabla) y seleccionamos del menú contextual la opción "Abrir como Administrador". 


## Modificando el archivo _hosts_

Si importar el sistema operativo, la sintaxis del archivo _hosts_ será la siguiente: 

```bash
<ip.del.equipo>  <nombre_De_Dominio>
```


Si tomamos como ejemplo el dominio ficticio `dominio.tld` y suponiendo que la dirección IP del equipo servidor es `192.168.0.33`, el contenido del archivo _hosts_ nos quedará como sigue:

```bash
192.168.0.33  www.dominio.tld  dominio.tld  http://dominio.tld
```

Si configuramos correctamente el archivo _hosts_ de nuestro sistema, podremos acceder al/los dominio/s especificados. 

!!! warning "Resolución de dominios empleando el archivo _hosts_"
	Si en una red local, decidimos resolver los nombres de dominio valiéndonos del archivo _hosts_ tendremos que copiar el mismo archivo _hosts_ en cada uno de los equipos que compongan la red.

## El archivo hosts y la seguridad
Como estudiamos anteriormente, el arhivo _hosts_ fue creado para la resolución de dominios. Sin embargo, dicho archivo posee opciones interesantes para securizar un sistema que compone una red informática. 

### TCP Wrappers
{EN DESARROLLO}

* https://blog.carreralinux.com.ar/2016/10/reglas-para-tcp-wrappers-ejemplos-linux/
* https://www.taringa.net/posts/linux/16178276/Asegurando-el-sistema-con-hosts-deny-allow.html

### Blacklists 
Es posible bloquear el acceso a dominios indeseados (con contenido inapropiado o malware, por ejemplo) mediante el archivo _hosts_. Para este cometido, existen en la red diversas listas negras o _blacklists_ que contienen información sobre dominios maliciosos, ahorrándonos gran parte del trabajo. 

* [Ultimate Hosts Blacklist](https://github.com/mitchellkrogza/Ultimate.Hosts.Blacklist)
* [DNSBL - Domain Name System Blacklists](https://www.dnsbl.info/dnsbl-list.php)
* [Hosts](https://github.com/StevenBlack/hosts)
