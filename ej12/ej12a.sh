#!/bin/bash
echo "Introduzca un primer numero"
read num1
echo "Introduzca un segundo numero"
read num2
resultadoSuma=$(expr $num1 + $num2)
resultadoResta=$(expr $num1 - $num2)
resultadoMul=$(expr $num1 \* $num2)
aux="Son iguales"
if [ $num1 -gt $num2 ]; then
  mayor=$num1
elif [ $num1 -lt  $num2 ]; then
  mayor=$num2
else
  mayor=$aux
fi
echo "Suma: $resultadoSuma"
echo "Resta: $resultadoResta"
echo "Multiplicacion: $resultadoMul"
echo "Mayor: $mayor"
