#!/bin/bash
function productoria {
  if [ $# -eq 0 ]; then
    return 1
  fi
  local resultado=1
  for num in "$@"; do
    ((resultado = resultado * num))

  done
  echo "El resultado de multiplicar el arreglo es:  $resultado"
}


num=(10 3 5 7 9 3 5 4) # DEFINO EL ARREGLO

productoria "${num[@]}"
