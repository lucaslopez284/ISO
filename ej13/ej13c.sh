#!/bin/bash
nombre=$1
if [ -e "$nombre" ]; then
    if [ -d "$nombre" ]; then
       echo "El archivo $nombre es un directorio"
    else
       echo "El archivo $nombre es un archivo regular"
    fi
else
  echo "El archivo $nombre no existe"
  cd /home/lucas284/practica3/ej13/prueba
  echo "Estoy en el directorio: $(pwd)"

  mkdir "$nombre"
fi
