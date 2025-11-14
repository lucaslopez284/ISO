#!/bin/bash
if [ $# -ne 1 ]; then
  exit 1 #el script solo debe recibir un parametro
fi
usuario=$1
cadena=""  #inicializo cadena vacia
while [ -z "$cadena" ]; do
   cadena=$(who | grep "$usuario")
   sleep 10
done
echo "usuario $1 logueado en el sistema"
exit 0
