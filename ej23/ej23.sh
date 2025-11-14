#!/bin/bash
# Defino el arreglo
vector1=( 1 80 65 35 2 )
vector2=( 5 98 3 41 8 )
longitud=${#vector1[@]}
for ((i=0; i<longitud; i++)); do
  ((suma = ${vector1[$i]} + ${vector2[$i]}))
  echo "La suma de la posicion $i es: $suma" 
done
exit 0

