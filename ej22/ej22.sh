#!/bin/bash
# Defino el arreglo
num=(10 3 5 7 9 3 5 4)
impares=0
resto=""
for n in "${num[@]}"; do
  ((resto = n % 2))
  if [ $resto -eq "1" ];  then
    ((impares = impares + n))
  elif [ $resto -eq "0" ]; then
          echo "$n es par"
  fi
done
echo "Resultado de impares: $impares"
exit 0
