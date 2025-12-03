#!/bin/bash
if [ $# -lt 1 ]; then
   exit 1
fi

direc="$1"

if [ -d "$direc" ]; then
   arreglo=()
   for arc in "$direc"/*; do
       if [ -f "$arc" ]; then
          arreglo+=("$arc")
       fi
   done
fi

imprimir() {
  echo "${arreglo[@]}"
}

if [ $# -gt 2 ]; then
   op="$2"
   case $op in
      -a)direc2="$3"
         if [ -d "$direc2" ]; then
             for arc2 in "$direc2"/*; do
                 if [ -f "$arc2" ]; then
                     arreglo+=("$arc2")
                 fi 
             done
         fi
         imprimir
         ;;
      -d)patron="$3"
         borrar="0"
         if [ $# -gt 3 ]; then
            param="$4"
            if [ "$param" == "$-f" ]; then
                ((borrar+=1))
            fi
         fi
         for i in "${!arreglo[@]}"; do
             if [ "${arreglo[$i]}" == *"$patron"* ]; then
                 unset arreglo[$i]
                 arreglo=("${arreglo[@]}")
             fi
             if [ $borrar -gt 0 ]; then
               archivoABorrar="${arreglo[$i]}"
               rm "$archivoABorrar"
             fi
         done
         imprimir
         ;;
      *) echo "Opcion invalida"
   esac
fi
