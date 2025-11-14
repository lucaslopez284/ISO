#!/bin/bash
#Realice un script que mueva todos los programas del directorio actual (archivos
#ejecutables) hacia el subdirectorio “bin” del directorio HOME del usuario
#actualmente logueado. El script debe imprimir en pantalla los nombres de los
#que mueve, e indicar cuántos ha movido, o que no ha movido ninguno. Si el
#directorio “bin” no existe,deberá ser creado.

usuario=$(whoami)
origen=$(pwd)
destino="/home/$usuario/bin"
movidos=0
if [ ! -e "$destino" ]; then
  mkdir "$destino"
fi
for archivo in "$origen"/*; do
   if [ -f "$archivo" ] && [ -x "$archivo" ];
     echo "Voy a mover el archivo: $archivo"
     mv "$archivo" "$destino"
     ((movidos++))
   fi
done



if (( movidos > 0 )); then
   echo "La cantidad de archivos movidos es $movidos"
else
   echo "No se movio ningun archivo"
fi

exit 0

