#!/bin/bash
# Implemente la estructura de datos Set (Conjunto de valores) en Bash. Un
# conjunto se define como una colección de valores únicos, es decir que solo
# almacena una vez cada valor, aún cuando se intente agregar el mismo valor más
# de una vez. La implementación debe soportar las siguientes operaciones
# mediante funciones:
# ● initialize - inicializa el set vacío.
# ● initialize_with - inicializa el set con un conjunto de valores que recibe como
# argumento (debe validar que se reciba al menos uno).
# ● add - Agrega un valor al conjunto, el cual recibe como argumento. No debe
# agregar elementos repetidos. El resultado de la operación será un éxito solo si el
# valor puede ser agregado al conjunto.
# ● remove - Elimina uno o más valores del conjunto, los cuales recibe como
# argumentos. Si la operación elimina al menos un valor, se considera un éxito.
# ● contains - Chequea si el conjunto contiene un valor recibido como argumento. El
# resultado será éxito si el valor está en el conjunto.
# ● print - Imprime los elementos del conjunto, de a uno por línea.
# ● print_sorted - Imprime los elementos del conjunto, de a uno por línea y
# ordenados alfabéticamente. Tip: Investigar cómo combinar el comando sort con la función print.

initialize(){
  miSet=()
}

initialize_with(){
  if [ $# -lt 1 ]; then
     return 1 
  fi
  miSet+=("$1")
  shift 1 # descarta el primer parametro ya agregado
  for nuevo in "$@"; do
     long=${#miSet[@]}
     encontre=0
     i=0 
     while ((encontre == 0)) && [ $i -lt $long ]; do
        actual=${miSet[$i]}
        if [ "$nuevo" == "$actual" ]; then
            ((encontre++))
        fi
        ((i++))
    done
    if ((encontre == 0)); then
      miSet+=("$nuevo")
    fi
  done
}

add(){
  if [ $# -lt 1 ]; then
     return 1
  fi
  nuevo=$1
  long=${#set[@]}
  encontre=0
  i=0
  while ((encontre == 0)) && [ $i -lt $long ]; do
      actual=${miSet[$i]}
      if [ "$nuevo" == "$actual" ]; then
          ((encontre++))
      fi
      ((i++))
  done
  if ((encontre == 0)); then
     miSet+=("$nuevo")
     return 0
  else
     return 1
  fi
}

remove(){
  if [ $# -lt 1 ]; then
     return 1
  fi
  eliminados=0
  for parametro in "$@"; do
     long=${#miSet[@]}
     encontre=0
     i=0
     while ((encontre == 0)) && [ $i -lt $long ]; do
        actual=${miSet[$i]}
        if [ "$parametro" == "$actual" ]; then
            unset miSet[$i]
            ((eliminados++))
            ((encontre++))
        fi
        ((i++))
    done
  done
  if ((eliminados > 0)); then
    return 0
  else
    return 1
  fi
}


contains(){
  if [ $# -lt 1 ]; then
      return 1
  fi
  parametro=$1
  long=${#miSet[@]}
  encontre=0
  i=0
  while ((encontre == 0)) && [ $i -lt $long ]; do
      actual=${miSet[$i]}
      if [ "$parametro" == "$actual" ]; then
          ((encontre++))
      fi
      ((i++))
  done
  if ((encontre == 1)); then
     return 0
  else
     return 1
  fi
}

print(){
  long=${#miSet[@]}
  for((i=0;i<long;i++)); do
     echo "${miSet[$i]}"
  done
}

print_sorted(){
  long=${#miSet[@]}
  for((i=0;i<long;i++)); do
     echo "${miSet[$i]}"
  done | sort
  

}
