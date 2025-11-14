#!/bin/bash

echo "Selecciona un sistema operativo:"
select OS in "Linux" "macOS" "Windows" "Android" "Salir"; do
  case $OS in
    "Linux")
      echo "Elegiste Linux. ¡Excelente elección!"
      break
      ;;
    "macOS")
      echo "Elegiste macOS."
      break
      ;;
    "Windows")
      echo "Elegiste Windows."
      break
      ;;
    "Android")
      echo "Elegiste Android."
      break
      ;;
    "Salir")
      echo "Saliendo del menú."
      break
      ;;
    *)
      echo "Opción no válida. Por favor, selecciona un número de la lista."
      ;;
  esac
done

