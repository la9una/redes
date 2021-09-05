Un repositorio de software está compuesto por un repositorio central (oficial) y un conjunto de repositorios "espejo" o _mirrors_ distribuidos alrededor del mundo. Así, cada distribución de GNU/Linux posee su propio repositorio de software. 


* [Lista de _mirrors_ para la distribución Ubuntu](https://launchpad.net/ubuntu/+archivemirrors)


Esto es, servidores distribuidos a lo largo del planeta que ofrecen software bajo demanda, una suerte de "tienda de aplicaciones" para cada distribución. Para ser más precisos, cada distribución tiene su propio repositorio de software que es "espejado" (clonado) por otros servidores en diversos países y regiones y ofrecido a los usuarios finales del sistema operativo. 


## Archivos de configuración de repositorios 
En distribuciones basadas en Debian disponemos de un archivo que contiene información sobre el repositorio principal del sistema en la siguiente ubicación: 

* `/etc/apt/sources.list`

Es posible encontrar, además, archivos de repositorios secundarios (generalmente, no oficiales de la distribución), los cuáles se alojan en el siguiente directorio: 

* `/etc/apt/sources.list.d/`

## Ejemplo de archivo de repositorio

A continuación, se muestra el contenido del archivo /etc/apt/sources.list de la distribución Ubuntu 20.04 LTS (codename _Focal Fossa_)

```bash
deb http://ar.archive.ubuntu.com/ubuntu/ focal main restricted
deb http://ar.archive.ubuntu.com/ubuntu/ focal-updates main restricted
deb http://ar.archive.ubuntu.com/ubuntu/ focal universe
deb http://ar.archive.ubuntu.com/ubuntu/ focal-updates universe
deb http://ar.archive.ubuntu.com/ubuntu/ focal multiverse
deb http://ar.archive.ubuntu.com/ubuntu/ focal-updates multiverse
deb http://ar.archive.ubuntu.com/ubuntu/ focal-backports main restricted universe multiverse
deb http://archive.canonical.com/ubuntu focal partner
deb http://security.ubuntu.com/ubuntu focal-security main restricted
deb http://security.ubuntu.com/ubuntu focal-security universe
deb http://security.ubuntu.com/ubuntu focal-security multiverse0
```

NOTA: Se omitieron las líneas que comienzan con `deb-src` que ofrecen el código fuente de los paquetes. 

### Explicación de las características de los distintos tipos de repositorios

* [Ubuntu - main, restricted, universe y multiverse](https://geekland.eu/caracteristicas-repositorios-main-universe-multiverse-restricted/)
* [Debian - backports](https://geekland.eu/repositorio-backports-debian-estable/)