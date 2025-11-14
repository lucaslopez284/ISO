#!/bin/bash
#ejercicio hecho en conjunto con IA, se debe consultar con algun ayudante
directorio=/etc
archivo=group
cd $directorio
listaUsuarios=$(grep "users" $archivo | cut -d: -f4) #-f4 indica el campo a extraer
 # EJ: grupo:x:GID:usuario1,usuario2,usuario3/ Los usuarios se encuentran en el campo 4
arreglo=()
for usuario in ${listaUsuarios//,/ }; do #reemplazo comas por espacios
  arreglo+=($usuario)
done

for usuario in $arreglo; do
  echo "Usuario $usuario se encuentra en users"
done

if [ $# -eq "0" ]; then
  echo "No se recibieron parametros"
  exit 0
fi

case $1 in
  "-b") n=$2
        longitud=${#arreglo[@]}
        if [ $longitud -gt $n ]; then
            echo "${arreglo[$n]}"
        else echo "El elemento numero $n no existe dentro del arreglo"
        fi
        ;;
  "-l") longitud=${#arreglo[@]}
        echo "Longitud del arreglo: $longitud" ;;
  "-i") for usuario in ${arreglo[@]}; do
           echo "Usuario $usuario se encuentra en users"
       done;;
  *) echo "Opcion invalida"
     exit 1;;

exit 0
