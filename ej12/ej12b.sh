#!/bin/bash
dos="2"
if [ $# -eq $dos ]; then 
  resultadoSuma=$(expr $1 + $2)
  resultadoResta=$(expr $1 - $2)
  resultadoMul=$(expr $1 \* $2)
  aux="Son iguales"
  if [ $1 -gt $2 ]; then
    mayor=$1
  elif [ $1 -lt $2 ]; then
    mayor=$2
  else
    mayor=$aux
  fi
  echo "Suma: $resultadoSuma"
  echo "Resta: $resultadoResta"
  echo "Multiplicacion: $resultadoMul"
  echo "Mayor: $mayor"
elif [ $# -gt $dos ]; then
  echo "Se enviaron parametros por demas"
else
  echo "Se deben enviar dos parametros"
fi
