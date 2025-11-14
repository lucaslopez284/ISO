#!/bin/bash
if [ $# -eq "0" ]; then
  exit 1 #abandono el script si la cantidad de parametros recibidos es 0
fi

parametros=("$@") #$@ contiene todos los parametros separados uno del otro
cantInexistentes="0"
for ((i=0; i< ${#parametros[@]}; i++)) do
   resto=$((i % 2))
   archivo="${parametros[i]}"
   if [ ! $resto -eq "0" ]; then #chequeo que sea par
       if [ -f "$archivo" ]; then  #chequeo que sea archivo regular
         echo "$archivo es un archivo"
       elif [ -d "$archivo" ]; then #como no es archivo regular, chequeo si es directorio
            echo "$archivo es un directorio"
       else cantInexistentes=$((cantInexistentes + 1))  #si no es ni archivo ni directorio, entonces no existe
       fi
   else
      if [ ! -e "$archivo" ]; then #evaluo si los pares existen o no
          cantInexistentes=$((cantInexistentes + 1))

      fi
   fi
done

echo "La cantidad de archivos inexistentes es $cantInexistentes"

exit 0 # terminar con exit es una buena practica en shell
