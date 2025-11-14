#!/bin/bash
# Escribir un Programa de “Menu de Comandos Amigable con el Usuario” llamado
# menú, el cual, al ser invocado, mostrará un menú con la selección para cada uno
# de los scripts creados en esta práctica. Las instrucciones de cómo proceder
# deben mostrarse junto con el menú. El menú deberá iniciarse y permanecer
# activo hasta que se seleccione Salir. Por ejemplo:
# MENU DE COMANDOS
# 03. Ejercicio 3
# 12. Evaluar Expresiones
# 13. Probar estructuras de control
# ...
# Ingrese la opción a ejecutar: 03

leerParametros(){
 echo "Ingrese los parametros que seran enviados al programa del ejercicio $1"
 read parametros
}

menu(){
 echo "Menu de Comandos Amigable con el Usuario"
 echo "Seleccione el ejercicio que desee ejecutar"
 echo "03. Ejercicio 3"
 echo "12. Ejercicio 12"
 echo "13. Ejercicio 13"
 echo "14. Ejercicio 14"
 echo "15. Ejercicio 15"
 echo "16. Ejercicio 16"
 echo "17. Ejercicio 17"
 echo "18. Ejercicio 18"
 echo "20. Ejercicio 20"
 echo "21. Ejercicio 21"
 echo "22. Ejercicio 22"
 echo "23. Ejercicio 23"
 echo "24. Ejercicio 24"
 echo "25. Ejercicio 25"
 echo "26. Ejercicio 26"
 echo "27. Ejercicio 27"
 echo "28. Ejercicio 28"
 echo "29. Ejercicio 29"
 echo "30. Ejercicio 30"
 echo "31. Ejercicio 31"
 echo "32. Finalizar Script"
}

menu
echo "Ingrese la opcion a ejecutar: "
read op
while [ "$op" != "32" ]; do
   case $op in
     "03") bash /home/lucas284/practica3/ej3/ej3.sh
           ;;
     "12") select accion in a b c; do
                 case $accion in
                      "a") bash /home/lucas284/practica3/ej12/ej12a.sh
                           break
                           ;;

                      "b") leerParametros "$op$accion"
                           bash /home/lucas284/practica3/ej12/ej12b.sh $parametros
                           break
                           ;;
                      "c") leerParametros "$op$accion"
                           bash /home/lucas284/practica3/ej12/ej12c.sh $parametros
                           break
                           ;;
                      *) echo "Opcion invalida"
                 esac
           done
           ;;
     "13") select accion in a b c; do
                 case $accion in
                      "a") bash /home/lucas284/practica3/ej13/ej13a.sh
                           break
                           ;;
                      "b") bash /home/lucas284/practica3/ej13/ej13b.sh 
                           break
                           ;;
                      "c") leerParametros "$op$accion"
                           bash /home/lucas284/practica3/ej13/ej13c.sh $parametros
                           break
                           ;;
                      *) echo "Opcion invalida"
                 esac
           done
           ;;
     "14") leerParametros $op
           bash /home/lucas284/practica3/ej14/ej14.sh $parametros
           ;;
     "16") leerParametros $op
           bash /home/lucas284/practica3/ej16/ej16.sh $parametros
           ;;
     "17") bash /home/lucas284/practica3/e17/ej17.sh
           ;;
     "18") leerParametros $op
           bash /home/lucas284/practica3/ej18/ej18.sh $parametros
           ;;
     "20") bash /home/lucas284/practica3/ej20/ej20.sh
           ;;
     "21") bash /home/lucas284/practica3/ej21/ej21.sh
           ;;
     "22") bash /home/lucas284/practica3/ej22/ej22.sh
           ;;
     "23") bash /home/lucas284/practica3/ej23/ej23.sh
           ;;
     "24") leerParametros $op
           bash /home/lucas284/practica3/ej24/ej24.sh $parametros
           ;;
     "25") leerParametros $op
           bash /home/lucas284/practica3/ej25/ej25.sh $parametros
           ;;
     "26") bash /home/lucas284/practica3/ej26/ej26.sh
           ;;
     "27") leerParametros $op
           bash /home/lucas284/practica3/ej27/ej27.sh $parametros
           ;;
     "28") bash /home/lucas284/practica3/ej28/ej28.sh
           ;;
     "29") bash /home/lucas284/practica3/ej29/ej29.sh
           ;;
     "30") bash /home/lucas284/practica3/ej30/ej30.sh
           ;;
     "31") leerParametros $op
           bash /home/lucas284/practica3/ej31/ej31.sh $parametros
           ;;
     "32") exit 0
           ;;
     *) echo "Opcion invalida"
        ;;
   esac
   menu
   echo "Ingrese otra opcion a ejecutar: "
done
exit 0

