#/bin/bash
arreglo=$(cut -d : -f1 /etc/passwd)

existe() {
 if [ $# -lt 1 ]; then
    return 1
 fi
 esta="0"
 for usuario in ${arreglo[@]} do;
    if [ "$usuario" == "$1" ]; then
        ((esta+=1))
        break
    fi
 done
 if [ $esta -lt 1 ]; then
    return 1
 else
    return 0
 fi
}


eliminar_usuario() {
 if [ $# -lt 1 ]; then
    return 2
 fi
 esta="0"
 for i in ${!arreglo[@]}; do
    if [ "${arreglo[$i]}" == "$1" ]; then
        ((esta+=1))
        unset arreglo[$i]
        arreglo=("${arreglo[@]}")
        break
    fi
 done
 if [ $esta -lt 1 ]; then
    return 2
 else
    return 0
 fi
}



usuarios_con_patron() {
  if [ $# -lt 1 ]; then
    return 102
  fi
  cumplen="0"
  for usuario in ${arreglo[@]}; do
     if [ "$usuario" == *"$1"* ]; then
        ((cumplen+=1))
        echo "$usuario"
     fi
  done
  if [ $cumplen -lt 1 ]; then
     return 102
  else
     return 0
  fi
}


cantidad() {
  long="{#arreglo[@]}")
  if [ $long -lt 1 ]; then
     return 95
  else
      echo "$long"
      return 0
  fi
}

usuarios() {
  long="${#arreglo[@]}")
  if [ $long -lt 1 ]; then
     return 95
  else
      echo "${arreglo[@]}"
      return 0
  fi
}
