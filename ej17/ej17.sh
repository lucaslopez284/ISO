#!/bin/bash
listaArchivos=$(ls) #LISTA ARCHIVOS DEL DIRECTORIO ACTUAL
for archivo in $listaArchivos; do
  nombreProcesado=$(echo "$archivo" | tr -d 'Aa' | tr '[:lower:][:upper:]' '[:upper:][:lower:]') #PROCESA CADA ARCHIVO
  echo "$nombreProcesado" #IMPRIME EN PANTALLA EL NOMBRE DE CADA ARCHIVO
done
exit 0


