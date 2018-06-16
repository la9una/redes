#!/bin/bash

# Script para configurar MV nuevas
# @la9una 

# Verificando superusuario
if [ `whoami` != 'root' ] 
	then 
		echo "Por favor, ejecutá el script como usuario <root>" 
	exit 
fi

# Configurando el repositorio local
echo "=> Configurando el repositorio local"
sleep 1

mv /etc/apt/sources.list /etc/apt/sources.list.original
echo "deb http://192.168.0.200/ubuntu xenial main restricted universe multiverse" > /etc/apt/sources.list
echo "deb http://192.168.0.200/ubuntu xenial-updates main restricted universe multiverse" >> /etc/apt/sources.list

# Actualizando el repositorio
echo "=> Actualizando el información del repositorio"
sleep 1

apt update

# Actualizando el sistema
echo "=> Actualizando el sistema a la última versión diponible"
sleep 1

apt upgrade -y

# Instalando paquetes necesarios
echo "=> Instalando paquetes"
sleep 1

pkg_basico()
{
    local yn
    read -p "+++ Paquetes básicos +++ => ¿Instalar? [s/n] " yn
    case $yn in
        [YySs]* ) apt install -y vim tree bzip2 gzip zip unzip rar unrar sudo locales aptitude git;;
        [Nn]* ) echo "Instalación cancelada";;
        * ) echo "Por favor, ingresá 's' ó 'n'";;
    esac
}
pkg_basico
echo $yn


pkg_lamp()
{
    local yn
    read -p "+++ LAMP +++ => ¿Instalar? [s/n] " yn
    case $yn in
        [YySs]* ) apt install -y tasksel php-gettext php-mbstring && tasksel;;
        [Nn]* ) echo "Instalación cancelada";;
        * ) echo "Por favor, ingresá 's' ó 'n'";;
    esac
}
pkg_lamp
echo $yn
apt install -y phpmyadmin

echo "*** Todas las tareas fueron realizadas exitosamente ***"