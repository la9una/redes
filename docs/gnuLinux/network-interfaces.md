En GNU/Linux disponemos de multitud de herramientas gráficas para configurar la red. Sin embargo, podemos realizar las mismas configuraciones desde la terminal, sobre todo, si estamos frente a un terminal que no posee entorno gráfico. 


<div style="margin:0 auto; text-align:center;" >
<img src="../imgGNULinux/linux-network.jpg" alt="Linux Network">
</div>

El presente tutorial aplica a sistemas basados en Debian. En cualquier caso, tendremos que editar el siguiente archivo: 

```bash
sudo vim /etc/network/interfaces
```

## Configurando IP dinámica

```bash linenums="1"
# Interfaz local
auto lo
iface lo inet loopback

# Primera placa de red
auto enp0s3
iface enp0s3 inet dhcp
```

Finalmente habilitamos la interfaz de red

```bash
sudo ifdown enp0s3 && sudo ifup enp0s3
```

Y reiniciamos el demonio de red

```bash
sudo /etc/init.d/networking restart
```

## Configurando IP estática

```bash linenums="1"
# Interfaz local
auto lo
iface lo inet loopback

# Primera placa de red
auto enp0s3
iface enp0s3 inet static
	address <dirección-ip-mv>
	network <dirección-de-red>
	netmask <máscara-de-red>
	gateway <dirección-ip-router>
	dns-nameservers <dirección-ip-servidor-dns>
```

Por ejemplo: 

```apache linenums="1"
# Interfaz local
auto lo
iface lo inet loopback

# Primera placa de red
auto enp0s3
iface enp0s3 inet static
	# Dirección del equipo
	address 192.168.0.222
	# Dirección de red
	network 192.168.0.0
	# Máscara de red
	netmask 255.255.255.0
	# Puerta de enlace predeterminada
	gateway 192.168.0.1
	# Servidor DNS
	dns-nameservers 8.8.8.8
```

Deshabilitamos la interfaz de red

```bash
sudo ifdown enp0s3
```
_O bien_

```bash
sudo ip link set enp0s3 down
```

Volvemos a habilitar la interfaz de red

```bash
sudo ifup enp0s3
```

_O bien_

```bash
sudo ip link set enp0s3 up
```


Reiniciamos el demonio de red

```bash
sudo service networking restart
```

_O bien_

```bash
sudo /etc/init.d/networking restart
```

Y si es necesario, reiniciamos el sistema

```bash
sudo init 6
```

_O bien_

```bash
sudo reboot
```

## Verificando IP del equipo
Para poder visualizar la direcciones IPs asignadas a las interfaces de red que tengamos configuradas en el equipo podemos ejecutar: 

```bash
sudo ifconfig
```
_O bien_ 

```bash
sudo ip a
```

## Configurando Proxy de la red
Si nuestro equipo se encuentra detrás de un proxy, tendremos que realizar configuraciones adicionales. 

1. Crear un archivo vacío dentro de `/etc/apt` llamado `apt-conf`:

```bash
sudo vi /etc/apt/apt.conf
```

2. Ingresar el siguiente contenido: 

```bash linenums="1"
Acquire::http::Proxy "http://<direccion-IP-del-proxy>:<puerto>";
```

!!!warning "Proxy con autenticación / seguro"
		En caso que necesitamos autenticarnos en el servidor proxy, cambiaremos la línea 
		
		`http://<direccion-IP-del-proxy>:<puerto>` 
		
		por 
		
		`http://<usuario>:<contraseña>@<direccion-IP-del-proxy>:<puerto>` 
		
		Si se trata de un servidor seguro, simplemente cambiaremos `http` por `https`