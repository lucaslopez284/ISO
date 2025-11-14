#!/bin/bash
#Implemente un script que agregue a un arreglo todos los archivos del directorio
#/home cuya terminación sea .doc. Adicionalmente, implemente las siguientes
#funciones que le permitan acceder a la estructura creada:
#➢ verArchivo <nombre_de_archivo>: Imprime el archivo en pantalla si el
#mismo se encuentra en el arreglo. Caso contrario imprime el mensaje
#de error “Archivo no encontrado” y devuelve como valor de retorno 5
#➢ cantidadArchivos: Imprime la cantidad de archivos del /home con
#terminación .doc
#➢ borrarArchivo <nombre_de_archivo>: Consulta al usuario si quiere
#eliminar el archivo lógicamente. Si el usuario responde Si, elimina el
#elemento solo del arreglo. Si el usuario responde No, elimina el
#archivo del arreglo y también del FileSystem. Debe validar que el
#archivo exista en el arreglo. En caso de no existir, imprime el mensaje
#de error “Archivo no encontrado” y devuelve como valor de retorno 10

inicializar(){
  arregloArchivos=() #arreglo vacio
  directorio=/home #directorio a analizar
  for archivo in "$directorio"/*; do
     if [ -f "$archivo" ] && [ "$archivo" == *.doc ]; then
          arregloArchivos+=("$archivo")
     fi
  done
}

verArchivo(){
  if [ $# -lt 1 ]; then
     return 1
  fi
  encontrado=0
  archivoBuscado=$1
  archivoAImprimir=""
  for archivo in "${arregloArchivos[@]}"; do
      if [ "$archivo" == "$archivoBuscado" ]; then
          encontrado=1
          archivoAImprimir="$archivo"
          break
      fi
  done
  if (( encontrado == 1 )); then
     cat "$archivoAImprimir"
  else
     echo "Archivo no encontrado"
     return 5
  fi
}


cantidadArchivos(){
  echo "${#arregloArchivos[@]}"
}

borrarArchivo(){
  if [ $# -lt 1 ]; then
     return 1
  fi
  pos=-1
  encontrado=0
  archivoBuscado=$1
  archivoABorrar=""
  for ((i=0;i<${#arregloArchivos[@]};i++)); do
      archivo="${arregloArchivos[$i]}"
      if [ "$archivo" == "$archivoBuscado" ]; then
          encontrado=1
          archivoABorrar="$archivo"
          pos=$i
          break
      fi
  done
  if (( encontrado == 1 )); then
     echo "Queres borrar el archivo logicamente?"
     select accion in Si No
     do
       case "$accion" in
            "Si") unset arregloArchivos[$pos] #borrado logico
                  return 0;;
            "No") unset arregloArchivos[$pos] #borrado logico
                  cd /home
                  rm $archivoABorrar #borrado del fileSystem
                  return 0;;
            *) echo "Opción inválida. Elegí 1 (Si) o 2 (No)."
               ;;
       esac
     done
  else
     echo "Archivo no encontrado"
     return 10
  fi
}

