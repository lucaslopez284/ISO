#!/bin/bash
# Realice un script que reciba como argumento una lista de posibles nombres de
# usuarios del sistema y, para cada uno de los que efectivamente existan en el
# sistema y posean un directorio personal configurado que sea válido, realice las
# modificaciones necesarias en su directorio personal para que tenga un
# subdirectorio llamado “directorio_iso” con la estructura del cuadro.

if [ $# -lt 1 ]; then
   exit 1
fi

for usuario in "$@"; do
  if id "$usuario" &>/dev/null; then #verifico si el usuario existe
      home=$(eval echo "~$usuario") #obtengo directorio personal de usuario
      if [ -d "$home" ]; then  #verifico que home exista
          mkdir -p "$home/directorio_iso"
          for ((anio=2025; anio<2027;anio++)); do
              mkdir -p "$home/directorio_iso/$anio"
              for ((mes=1; mes<13; mes++)); do
                  # Mes con dos dígitos
                  mesF=$(printf "%02d" "$mes")
                  mkdir -p "$home/directorio_iso/$anio/$mesF"
                  touch "$home/directorio_iso/$anio/$mesF/archivo.txt"
              done
          done
      fi
  fi
done
exit 0
