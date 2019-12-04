El servidor **ISC DHCP** ofrece una solución completa de código abierto para implementar servidores DHCP, agentes de retransmisión y clientes. ISC DHCP es compatible con IPv4 e IPv6, y es adecuado para su uso en aplicaciones de alto volumen y alta confiabilidad. DHCP está disponible para descarga gratuita bajo los términos de la licencia MPL 2.0.


El servidor se encuentra disponible en los repositorios de software de la mayoría de las distribuciones GNU/Linux. Para instalar, ejecutamos en la terminal: 

```bash
sudo apt install isc-dhcp-server
```

## Configuración inicial
Para configurar el servidor nos movemos hacia el directorio `/etc/dhcp` y modificamos el archivo `dhcp.conf` de modo que nos quede como sigue:  

```bash
default-lease-time 600
max-lease-time 700

# Definición de ámbito (puede haber más)
    subnet 192.168.1.0 netmask 255.255.255.0 {
    range 192.168.1.2 192.168.1.10;
    option subnet-mask 255.255.255.0;
    option broadcast-address 192.168.1.255;
    option routers 192.168.1.138;
    option domain-name-servers 8.8.8.8;
    option domain-name "itel";
}

# Reservar dirección ip a un equipo llamado alumno
host alumno {
    hardware-ethernet 08:00:27:6c:30:96;
    fixed-address 192.168.0.32; 
}
```

_Base de conocimiento: https://escueladeinformatica.es/wordpress/configurar-servidor-dhcp-en-ubuntu-18-04_