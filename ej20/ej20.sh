#!/bin/bash
#Realice un script que simule el comportamiento de una estructura de PILA e
#implemente las siguientes funciones aplicables sobre una estructura global
#definida en el script:
#➔ push: Recibe un parámetro y lo agrega en la pila
#➔ pop: Saca un elemento de la pila
#➔ length: Devuelve la longitud de la pila
#➔ print: Imprime todos elementos de la pila
#Dentro del mismo script y utilizando las funciones implementadas:
#1. Agregue 10 elementos a la pila
#2. Saque 3 de ellos
#3. Imprima la longitud de la pila
#4. Luego imprima la totalidad de los elementos que en ella se encuentran.

inicializar(){
  pila=()
}

push(){
  if [ $# -lt 1 ]; then
     exit 1
  fi
  pila+=("$1")
}

pop(){
  long=${#pila[@]}
  if [ "$long" -eq 0 ]; then
     echo "Error: la pila está vacía"
     return 1
  fi
  ((long--))
  unset pila[$long]
}

length(){
  echo ${#pila[@]}
}

print(){
  long=${#pila[@]}
  for((i=0;i<long;i++)); do
     elemento=${pila[$i]}
     echo "elemento $i: $elemento"
  done
}

#PUNTO 0
inicializar

#PUNTO 1
push 1
push 2
push 3
push 4
push 5
push 6
push 7
push 8
push 9
push 10

#PUNTO 2
pop
pop
pop

#PUNTO 3
length

#PUNTO 4
print

exit 0
