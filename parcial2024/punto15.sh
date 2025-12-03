#!/bin/bash

if [ $# -lt 1 ]; then
    exit 1
fi

inexistentes="0"

for param in "$@" do;
    if [ -f $param ]; then # si es un archivo, lo comprimo
       gzip "$param"
    elif [ -d $param ]; then # si es un directorio, analizo permisos
            if [ -r $param ]; then # si tiene permiso de lectura, empaqueto y comprimo
               tar -czf "tar.gz" $param
            fi
            if [ -w $param ]; then # si tiene permiso de escritura, lo borro
               rm -r $param
            fi
    else
       if [ ! -e $param ]; then #si no existe, lo cuento
          ((inexistentes+=1))
       fi    
    fi
done
echo "La cantidad de elemenostos no existentes es: $inexistentes"
exit 0
