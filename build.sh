#!/bin/bash
# Script para pushear mkdocs en GitHub
version=docs
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
echo "*****************************"
echo "Generando el sitio estático"
echo "*****************************"
mike deploy $version
git checkout gh-pages
git push
git checkout main
sleep 1
echo "[OK]"
echo "*************************************"
echo "Tareas realizadas exitosamente!"
echo "*************************************"

