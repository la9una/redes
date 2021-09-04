#!/bin/bash
# Script para pushear mkdocs en GitHub
version=docs
echo "**********************************"
echo "Enviando cambios de la rama main"
echo "**********************************"
sleep 1
echo "[OK]"
git checkout main
mike deploy $version
git add .
echo "Ingrese texto del commit"
read commitext
# echo "`date +'%Y-%m-%d'-'%T'` => $commitext"
# echo "$commitext"
git commit -m "$commitext"
git push
echo "[OK]"
echo "**************************************"
echo "Enviando cambios en la rama gh-pages"
echo "**************************************"
git checkout gh-pages
git push
git checkout main
sleep 1
echo "[OK]"
echo "*********************************"
echo "Tareas realizadas exitosamente!"
echo "*********************************"

