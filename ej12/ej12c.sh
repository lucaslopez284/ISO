#!/bin/bash
tres="3"
suma="+"
resta="-"
mul="*"
div="%"
if [ $# -eq $tres ]; then
  case $1 in
       "+")
           resultado=$(expr $2 + $3)
           echo "Suma: $resultado"
           ;;
       "-")
           resultado=$(expr $2 - $3)
           echo "Resta: $resultado"
           ;;
       \*)
          resultado=$(expr $2 \* $3)
          echo "Multiplicacion: $resultado"
          ;;
      "%")
          resultado=$(expr $2 / $3)
          echo "Division: $resultado"
          ;;
       *)
          echo "Operacion no valida"
          ;;
  esac
else
  echo "Se deben enviar una operacion valida y dos numeros"
fi

