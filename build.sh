#!/bin/bash
# Script para pushear mkdocs en GitHub

echo "*****************************"
echo "Generando el sitio estático"
echo "*****************************"
mkdocs build --clean
sleep 1
echo "[OK]"
echo "*************************************"
echo "Guardando cambios en la rama main"
echo "*************************************"
sleep 1
echo "[OK]"
git checkout main
git add .
echo "Ingrese texto del commit"
read commitext
# echo "`date +'%Y-%m-%d'-'%T'` => $commitext"
# echo "$commitext"
git commit -m "$commitext"
git push
echo "[OK]"
echo "*************************************"
echo "Tareas realizadas exitosamente!"
echo "*************************************"

