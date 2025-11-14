#!/bin/bash

function inicializar(){
  arrayVacio=()
}

function agregar(){
  if [ $# -lt 1 ]; then
     exit 1
  fi
  long=${#arrayVacio[@]}
   arrayVacio[$long]=$1
}


function longitud(){
  long=${#arrayVacio[@]}
  echo "La longitud del arreglo es $long"
}

function eliminarElem(){
  if [ $# -lt 1 ]; then
     exit 1
  fi
  n=$1
  long=${#arrayVacio[@]}
  if [ $long -gt $n ]; then
    unset arrayVacio[$n]
  fi
}

function imprimir(){
  long=${#arrayVacio[@]}
  for((i=0;i<$long;i++)) do
    elem=${arrayVacio[$i]}
    echo "Elemento indice $i: $elem"
  done
}

function inicializarConValores(){
  if [ $# -lt 2 ]; then
     exit 1
  fi
  long=$1
  valor=$2
  for((i=0;i<$long;i++)) do
     arrayVacio[$i]=$valor
  done
}

