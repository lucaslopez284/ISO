#!/bin/bash
for ((i=0; i<=100; i++)); do
     numero=$i
     cuadrado=$(expr $i \* $i)
     echo "Numero: $numero"
     echo "Cuadrado: $cuadrado"
done
