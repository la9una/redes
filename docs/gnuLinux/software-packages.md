# Gestión de software
El modelo de distribución y gestión de software en las diferentes versiones (llamadas comunmente "distribuciones") de GNU/Linux data de hace algunos años y se han ido optimizando con el tiempo, siendo emulado por otras plataformas y dispositivos. 

## Repositorios de software 
Cada distribución de GNU/Linux, en general, posee su propio repositorio de software. Esto es, servidores distribuidos a lo largo del planeta que ofrecen software bajo demanda, una suerte de "tienda de aplicaciones" para cada distribución. Para ser más precisos, cada distribución tiene su propio repositorio de software que es "espejado" (clonado) por otros servidores en diversos países y regiones y ofrecido a los usuarios finales del sistema operativo. 


!!! done "Configuración del repositorio"

        En distribuciones basadas en Debian, el archivo del sistema que contiene información sobre los repositorios se encuentra en el archivo `/etc/apt/sources.list`. Repositorios secundarios, pueden encontrarse en archivos independientes dentro de la carpeta `/etc/apt/sources.list.d/`. 

## Formatos de paquetes 
En ambientes *NIX es común referirse a los distintos programas de software bajo el nombre de "paquetes". No obstante, no existe un único tipo/formato de paquetes: estos dependen de cada distribución. 

!!! done "Formatos de paquetes más respresentativos"
        Algunos de los formatos de paquetes más importantes según familias de distribuciones:

        * `.rpm` (CenOS, Fedora, RedHat, etc)
        * `.deb` (Debian, Ubuntu, Linux Mint, etc)

## Instalación de software
La instalación de software en distribuciones GNU/Linux se puede llevar adelante mediante 3 maneras diferentes: 

1. A través de la tienda de aplicaciones de la distribución
2. Mediante un gestor de paquetes alternativo
3. Instalando paquetes de manera aislada
4. Compilando paquetes a partir de su código fuente

En este curso, pondremos incapié en el punto 2. 

### Comando básicos para gestión de software
A continuación se listan comandos básicos de gestión de software para distribuciones basadas en Debian, mediante el gestor de paquetes **apt**.

**Actualizar la información de los repositorios**
Esta acción no instalará ningún paquete, solo comparará la base de datos de paquetes remota con la base de datos de paquetes instalados localemnte e informará actualizaciones en caso de existir.  

```bash
sudo apt update
```

#### Actualizar todos los paquetes del sistema

Para actualizar los paquetes de software del sistema local, sólo ejecutaremos el siguiente comando: 

```bash
sudo apt upgrade
```
Si además queremos incluir los cambios de versión mayor (como una versión de la distribución) ejecutamos: 

```bash
sudo apt dist-upgrade
```

#### Instalar un paquete de software particular

Si sólo deseamos instalar uno o más paquetes puntuales, ejecutamos el siguiente comando: 

```bash
sudo apt install <paquete1> <paquete2>
```
Y el sistema se encargará de instalar automáticamente, las **dependencias** que cada paquete posea (es decir, el software adicional necesario para que el software que instalamos, funcione correctamente). 

#### Eliminar un paquete de software

Para desinstalar un paquete podemos hacerlo de dos maneras: desinstalar el paquete pero conservar sus archivos de configuración o desinstalarlo completamente. 

Para desinstalar sólamente el paquete: 

```bash
sudo apt remove <paquete>
```

Si además queremos remover todos los archivos de configuración relacionados con el paquete a desinstalar: 

```bash
sudo apt purge <paquete>
```
#### Remover paquetes no utilizados
Luego de desinstalar un paquete o por cambios en las dependencias de uno de ellos, es posible que tengamos instalados en el sistema, paquetes que no se utilizan. Adicionalmente, al realizar una actualización de repositorio, la información de los paquetes en nuestro sistema local puede quedar obsoleta, respecto de las actualizaciones realizadas en el repositorio remoto. 

Para eliminar paquetes que no se usan: 

```bash
sudo apt autoremove
```
Para eliminar indice de paquetes obsoleto: 

```bash
sudo apt autoclean
```

''' done "Gestores de paquetes"
        En distribuciones Debien, existen otros gestores de paquetes alternativos que ofrecen una interfaz gráfica o más amigable para la gestión de software. 

