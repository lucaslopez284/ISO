#!/bin/bash
usuarios=$(cut -d : -f1 /etc/passwd)
directorios=$(cut -d :-f6 /etc/passwd)

encontre="0"

for i in ${!usuarios[@]} do;
   direc="${directorios[$i]}" 
   if [ -d "$direc" ]; then
     usuario="${usuarios[$i]}"
     echo "$usuario"
     ((encontre+=1))
   fi
done

if [ $encontre -lt 1 ]; then  
    exit 1
fi
exit 0
