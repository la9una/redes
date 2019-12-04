# Archivos de zona - Ejemplo

Un servidor DNS es capaz de resolver consultas sobre nombres de dominio gracias a los archivos de zona. Para cada dominio, estos archivos de zona son básicamente 2:

* **Archivo de zona de resolución directa**: contiene la información necesaria para convertir nombres de dominio en direcciones IP. 
* **Archivo de zona de resolución inversa** contiene la información necesaria para convertir direcciones IP en el respectivo nombre de sistema. 

## ¿Cuáles son los objetivos de esta sección?

Configurar los archivos de zona necesarios para el dominio local `itel.lan`, que a su vez, albergará los siguientes subdominios:

| Host    | Rol                           | FQDN Privado     | IP Privada  |
| ------- | ----------------------------- | ---------------- | ----------- |
| dns1    | Servidor DNS Primario         | dns1.itel.lan    | 192.168.0.2 |
| dns2    | Servidor DNS Secundario       | dns2.itel.lan    | 192.168.0.3 |
| mail1   | Servidor de Correo Primario   | mail1.itel.lan   | 192.168.0.8 |
| mail2   | Servidor de Correo Secundario | mail2.itel.lan   | 192.168.0.9 |
| server1 | Servidor Web                  | server1.itel.lan | 192.168.0.6 |
| server2 | Servidor LDAP                 | server2.itel.lan | 192.168.0.7 |

Para ello, seguiremos unos sencillos pasos que se detallan a continuación. 

### Creando el directorio donde alojaremos nuestros archivos de zona
Aunque este paso no es estrictamente necesario, lo haremos para mantener el orden de nuestros archivos de zona: crearemos una carpeta llamada `zonas` dentro del directorio principal de **bind**: 

```apache
sudo mkdir /etc/bind/zonas && cd /etc/bind/zonas
```

### Creando los archivos de zona

En este paso vamos a crear nuestros dos archivos de zona: 

| Nombre del achivo      | Tipo de archivo de zona    | Ubicación            | 
| ---------------------  | ---------------------------| -------------------- | 
| `db.itel.lan`          | Resolución directa         | `/etc/bind/zonas`    | 
| `db.0.168.192`         | Resolución inversa         | `/etc/bind/zonas`    | 

Lo haremos ejecutando el siguiente comando: 

```apache
sudo touch db.itel.lan db.0.168.192
```
### Declarando los archivos de zona
Debemos "avisar" a **bind** que hemos creado nuestros archivos de zona. Lo haremos abriendo el archivo `/etc/bind/named.conf.local`:

```bash
sudo vim /etc/bind/named.conf.local
```

Una vez allí, declaramos nuestros archivos de zona creados en el paso anterior: 

```bash linenums="1"
// Zona de resolución directa

    zone "itel.lan" {
        type master;
        file "/etc/bind/zonas/db.itel.lan";
    };

// Zona de resolución inversa

    zone "0.168.192.in-addr.arpa" {
        type master;
        file "/etc/bind/zonas/db.0.168.192";
    };
```

### Creanto el contenido de nuestro archivo de zona de resolución directa

A continuación se exhibe el contenido de un hipotético archivo de zona de resolución directa (y que hemos llamado `db.itel.lan`) para el dominio `itel.lan`:

```apache linenums="1"

;
; BIND - Archivo de zona de resolución directa - itel.lan
;

$ORIGIN itel.lan.
$TTL 86400

;;; Inicio de la autoridad
@                   IN      SOA      dns1.itel.lan.   administrador.itel.lan. (
                            2013050601 ; numero de serie
                            6H         ; actualizar luego de 6 horas
                            1H         ; reintentar conexion luego de 1 hora
                            1W         ; expirar luego de 1 semana
                            1D )       ; valor minimo de TTL
;;; Servidores DNS
itel.lan.           IN      NS       dns1.itel.lan.
itel.lan.           IN      NS       dns2.itel.lan.

;;; Servidores de correo
itel.lan.           IN      MX       10     mail1.itel.lan.
itel.lan.           IN      MX       20     mail2.itel.lan.

;;; Otros equipos
itel.lan.           IN      A        192.168.0.5
dns1.itel.lan.      IN      A        192.168.0.2
dns2.itel.lan.      IN      A        192.168.0.3
mail1.itel.lan.     IN      A        192.168.0.8
mail2.itel.lan.     IN      A        192.168.0.9
server1.itel.lan.   IN      A        192.168.0.6
server2.itel.lan.   IN      A        192.168.0.7

;;; Alias
ftp.itel.lan.       IN      CNAME    server1
www.itel.lan.       IN      CNAME    server2
mail1.itel.lan.     IN      CNAME    correo1
mail2.itel.lan.     IN      CNAME    correo2
```

O bien, de manera sintética: 

```apache linenums="1"

;
; BIND - Archivo de zona de resolución directa - itel.lan
;

$ORIGIN itel.lan.
$TTL 86400

;;; Inicio de la autoridad
@   IN      SOA     dns1.itel.lan.   administrador.itel.lan. (
                            2013050601 ; numero de serie
                            6H         ; actualizar luego de 6 horas
                            1H         ; reintentar conexion luego de 1 hora
                            1W         ; expirar luego de 1 semana
                            1D )       ; valor minimo de TTL
;;; Servidores DNS
            NS      dns1
            NS      dns2

;;; Servidores de correo
            MX      10     mail1
            MX      20     mail2

;;; Otros equipos
            A       192.168.0.5
dns1        A       192.168.0.2
dns2        A       192.168.0.3
mail1       A       192.168.0.8
mail2       A       192.168.0.9
server1     A       192.168.0.6
server2     A       192.168.0.7

;;; Alias
ftp         CNAME   server1
www         CNAME   server2
mail1       CNAME   correo1
mail2       CNAME   correo2
```

### Creanto el contenido de nuestro archivo de zona de resolución inversa

Ahora, se muestra el contenido de ejemplo del archivo de zona de resolución inversa (que hemos llamado `db.0.168.192`) para el dominio `itel.lan`:

```apache linenums="1"

;
; BIND - Archivo de zona de resolución inversa - itel.lan
;

$ORIGIN 0.168.192.in-addr.arpa.
$TTL 86400

;;; Inicio de la autoridad
@   IN      SOA     dns1.itel.lan.   administrador.itel.lan. (
                            2013050601 ; numero de serie
                            6H         ; actualizar luego de 6 horas
                            1H         ; reintentar conexion luego de 1 hora
                            1W         ; expirar luego de 1 semana
                            1D )       ; valor minimo de TTL

2     IN     NS     dns1.itel.lan.
3     IN     NS     dns2.itel.lan.
8     IN     PTR    mail1.itel.lan.
9     IN     PTR    mail2.itel.lan.  
6     IN     PTR    server1.itel.lan.
7     IN     PTR    server2.itel.lan.
```

### Verficicando la configuración

Por último, verificamos que el archivo de configuración no contenga errores:

```bash
sudo named-checkconf
```

Y reiniciamos el servidor:

```bash
sudo /etc/init.d/bind9 restart
```

O bien:

```bash
sudo service bind9 restart
```