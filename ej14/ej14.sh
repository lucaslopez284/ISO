#!/bin/bash
if [ $# -ne 3 ]; then
    exit 1 #salgo si la cant de parametros no es 3
fi
if [ ! -d "$1" ]; then
  exit 1; #salgo si el parametro no es un directorio
fi

directorio=$1
cadena=$2
opcion=$3
cd "$directorio"
listaArchivos=$(ls)
for archivo in $listaArchivos; do   # for archivo in "$directorio"/*; do
  if [ -f $archivo ]; then
      case $opcion in
        "-a") nuevo=${archivo}${cadena} ;;
        "-b") nuevo=${cadena}${archivo} ;; 
          *) exit 1;;
      esac
      mv "$archivo" "$nuevo"
  fi
done
exit 0 



