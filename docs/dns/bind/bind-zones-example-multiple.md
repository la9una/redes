Es posible configurar un único servidor para que resuelva diferentes nombres de dominio. En este ejemplo, configuraremos nuestro servidor DNS para que sea capaz de resolver consultas directas en inversas para los dominios ficticios: `dominio1.com` y `dominio2.org`.

!!!warning "Número de serie"
        Al configurar un mismo servidor para que resuelva varios dominios, los archivos de zona deberán tener el **mismo número de serie**.

## 1. Declaramos los archivos de zona

Para ello, abrimos el archivo `named.conf.local`:

```apache
sudo vim /etc/bind/named.conf.local
```

Y declaramos nuestros archivos de zona: de resolución directa para los dominios mencionados y un único archivo de zona de resolución inversa:

```apache linenums="1"

// dominio1.com - Resolución directa
zone "dominio1.com"{
    type master;
    file "/etc/bind/zonas/db.dominio1.com";
};

// dominio2.org - Resolución directa
zone "dominio2.org"{
    type master;
    file "/etc/bind/zonas/db.dominio2.org";
};

// Ambos dominios - Resolución inversa
zone "0.168.192.in-addr.arpa"{
    type master;
    notify no;
    file "/etc/bind/zonas/db.0.168.192";
};

```

## 2. Configurando archivos de zona

A continuación, se muestra contenido de ejemplo para los distintos archivos de zona. 

### Archivo resolución directa - dominio1.com

Abrimos el archivo de zona de resolución directa: 

```apache
sudo vim /etc/bind/zonas/db.dominio1.com
```

Y agregamos el contenido:

```apache linenums="1"
;
; Archivo de zona de resolución directa para dominio1.com
;

$ORIGIN dominio1.com.
$TTL    604800

@   IN  SOA dominio1.com. admin.dominio1.com. (
                    101220150   ; Serial
                    604800      ; Refresh
                    86400       ; Retry
                    2419200     ; Expire
                    604800 )    ; Negative Cache TTL

        IN  NS      dns
dns     IN  A       192.168.0.50
web1    IN  A       192.168.0.51
web2    IN  A       192.168.0.12
www1    IN  CNAME   web1
www2    IN  CNAME   web2

```

### Archivo resolución directa - dominio2.org

Abrimos el archivo de zona de resolución directa: 

```apache
sudo vim /etc/bind/zonas/db.dominio2.org
```

Y colocamos el siguiente contenido (de ejemplo):

```apache linenums="1"
;
; Archivo de zona de resolución directa para dominio2.org
;

$ORIGIN dominio2.org.
$TTL    604800

@       IN  SOA dominio1.com. admin.dominio1.com. (
                    101220150   ; Serial
                    604800      ; Refresh
                    86400       ; Retry
                    2419200     ; Expire
                    604800 )    ; Negative Cache TTL

        IN  NS      dns.dominio1.com.
web1    IN  A       192.168.0.51
web2    IN  A       192.168.0.12
www1    IN  CNAME   web1
www2    IN  CNAME   web2
```

### Archivo resolución inversa

Ambos nombres de dominio compartirán el mismo archivo de resolución inversa. 

Para ello, abrimos el archivo en cuestión:

```apache
sudo vim /etc/bind/db.0.168.192
```

Y agregamos el siguiente contenido (ejemplo):

```apache linenums="1"

;
; Archivo de zona de resolución inversa para ambos dominios
;

$ORIGIN 0.168.192.in-addr.arpa.
$TTL    604800
@    IN  SOA dominio1.com. root.dominio1.com. (
                101220150   ; Serial
                604800      ; Refresh
                86400       ; Retry
                2419200     ; Expire
                604800 )    ; Negative Cache TTL

     IN  NS     dns.dominio1.com.
50   IN  PTR    dns.dominio1.com.
51   IN  PTR    web1.dominio1.com.
51   IN  PTR    web1.dominio2.org.
12   IN  PTR    web2.dominio1.com.
12   IN  PTR    web2.dominio2.org.

```

