Un servidor **DNS Caché** no tiene autoridad sobre ningún dominio (zona de autoridad). Se función es la de reenviar una consulta acerca de un dominio determinado y luego memorizar la respuesta para no tener que volver a preguntarla.



La configuración generada durante la instalación es perfectamente funcional, no requiere modificaciones. 

No obstante, vamos a definir a cuáles servidores consultará el nuestro para pedir ayuda en la resolución de nombres, si no es posible hacer esto localmente (forwarders). 

Como forwarders podemos elegir entre dos opciones: 

* Utilizar los servidores **DNS de nuestro ISP** o proveedor de acceso a Internet.

* Utilizar alguno de los servidores **DNS públicos**

!!!done "Servidores DNS públicos" 
    - [Comodo](https://www.comodo.com/secure-dns): `8.26.56.26 - 8.20.247.20`
    - [FoolDNS](http://www.fooldns.com/fooldns-community): `87.118.111.215 - 213.187.11.62`
    - [Google](https://developers.google.com/speed/public-dns): `8.8.8.8 - 8.8.4.4`
    - [OpenDNS](https://www.opendns.com): `208.67.222.222 - 208.67.220.220`
    - [OpenNIC](https://www.opennicproject.org): `66.70.211.246 - 128.52.130.209`
    - [Yandex](https://dns.yandex.com): `77.88.8.8 - 77.88.8.1`

Estos servicios prometen suministrar no sólo resoluciones más rápidas, sino también diversos servicios adicionales de seguridad, como filtros de direcciones maliciosos y otros más.