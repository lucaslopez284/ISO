#!/bin/bash
if [ $# -ne 1 ]; then
   exit 1 #La cantidad de parametros es uno y solo uno
fi
cadena=$1
cant=$(find / -name "$cadena"  2>/dev/null  | wc -l)
contenido="$(whoami) | $cant"
echo "$contenido" > reporte.txt
