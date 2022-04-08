#!/bin/bash
clear
if (( EUID != 0 ))
then
  echo "Aquest script s'ha d'executar amb prilegis de l'usuari root"
  exit 1 
fi
cd /etc/default
dt=`date +%y%m%d`
echo -n "Escribe el nombre de la carpeta dentro de /etc/default: "
read carpeta
if [ -d /etc/default/$carpeta ];
then
echo "El directorio existe"
cp -r /etc/default/$carpeta /media/$carpeta-$dt
exit 0
else
echo "El directorio no existe"
exit 1
fi

