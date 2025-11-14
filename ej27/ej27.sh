#!/bin/bash
if [ $# -lt 1 ]; then
  exit 1 #si no me enviaron ningun parametro, salgo
fi

directorio=$1
if [ ! -d "$directorio" ]; then
  exit 4 #si no es un directorio, salgo
fi

cantArchivosL=0
cantArchivosE=0
for archivo in "$directorio"/*; do
  if [ -f "$archivo" ]; then #si es un archivo regular, lo evaluo
     if [ -r "$archivo" ]; then # tiene lectura
         ((cantArchivosL++))
     fi
     if [ -w "$archivo" ]; then # tiene permisos de escritura
         ((cantArchivosE++))
     fi
  fi

done

echo "La cantidad de archivos en los que el usuario posee permisos de lectura(r) es: $cantArchivosL"
echo "La cantidad de archivos en los que el usuario posee permisos de escritura(w) es: $cantArchivosE"
exit 0
