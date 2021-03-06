Finalmente, en nuestra máquina física tendremos que colocar la dirección IP de nuestro servidor DNS, a fin que podamos acceder a los nombres de doiminios definidos. 

## En Microsoft Windows



## En GNU/Linux


Para ello, nos dirigimos al directorio `/etc/resolvconf/resolv.conf.d/`:

```apache
cd resolvconf/resolv.conf.d
```

Luego abrimos el archivo en cuestión: 

```apache
sudo vim base
```

Y añadimos el dominio `itel.lan` en el archivo, de manera que nos quede:

```apache linenums="1"
domain itel.lan
search itel.lan
nameserver 127.0.0.1
```

De esta forma, cuando nos referimos al sistema `server`, éste será buscado en el dominio `itel.lan`, resultando en el **FQHN** `server.itel.lan`

Además, verificamos que en el archivo `/etc/nsswitch.conf` la resolución de nombres pase también por el servicio DNS:

```bash linenums="1"
hosts:  files dns
```

Finalmente, reiniciamos el servicio DNS:

```bash
sudo service bind9 restart
```
