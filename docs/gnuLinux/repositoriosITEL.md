# Repositorio local 

Para usar los respositorios locales (alojados en el servidor del profesor), se deben seguir estos pasos: 

## 1. Abrir el archivo de repositorio
Como superusuario, ejecutamos para abrir el archivo en cuestión: 

```bash
sudo vim /etc/apt/sources.list
```
## 2. Comentar las líneas existentes
Para ello, anteponemos el signo de numeral (`#`) al comienzo de cada línea para dejarlas sin efecto. 

## 3. Agregar el repositorio local
Para ello, copiar y pegar las siguientes líneas: 

```bash
deb http://192.168.0.200/ubuntu bionic main restricted universe
deb http://192.168.0.200/ubuntu bionic-updates main restricted universe
```

# 4. Actualizar la información
Debemos indicar al sistema que hemos cambiado los repositorios ejecutando el siguiente comando: 

```bash
sudo apt update
```

Listo! A partir de ahora podremos instalar paquetes de software desde el repositorio local, ubicado en nuestra red LAN. 