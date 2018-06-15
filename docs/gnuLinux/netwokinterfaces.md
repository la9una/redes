En GNU/Linux disponemos de multitud de herramientas gráficas para configurar la red. Sin embargo, podemos realizar las mismas configuraciones desde la terminal, sobre todo, si estamos frente a un terminal que no posee entorno gráfico. 

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
auto enp0s25
iface enp0s25 inet dhcp
```

Finalmente habilitamos la interfaz de red

```bash
sudo ifdown enp0s25 && sudo ifup enp0s25
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
auto enp0s25
iface enp0s25 inet static
	address <dirección-ip-mv>
	network <dirección-de-red>
	netmask <máscara-de-red>
	gateway <dirección-ip-router>
```

Por ejemplo: 

```apache linenums="1"
# Interfaz local
auto lo
iface lo inet loopback

# Primera placa de red
auto enp0s25
iface enp0s25 inet static
	# Dirección del equipo
	address 192.168.0.222
	# Dirección de red
	network 192.168.0.0
	# Máscara de red
	netmask 255.255.255.0
	# Puerta de enlace predeterminada
	gateway 192.168.0.1
```

Habilitamos la interfaz de red

```bash
sudo ifdown enp0s25 && sudo ifup enp0s25
```

Reiniciamos el demonio de red

```bash
sudo /etc/init.d/networking restart
```

## Verificando IP del equipo
Para poder visualizar la direcciones IPs asignadas a las interfaces de red que tengamos configuradas en el equipo podemos ejecutar: 

```bash
sudo ifconfig
```
O bien: 

```bash
sudo ip a
```