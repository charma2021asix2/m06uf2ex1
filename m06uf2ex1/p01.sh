#!/bin/bash
clear
if (( EUID != 0 ))
then
  echo "Aquest script s'ha d'executar amb prilegis de l'usuari root"
  exit 1 
fi
echo -n "Nom de usuari: "
read nom
echo -n "Nova contrasenya: "
read password
echo "$nom:$password" | chpasswd
echo "Vols continuar?"
while true; do
	echo -en "Prem S per sortir \t \t "
	read input
	if [[ $input = "s" ]] || [[ $input = "S" ]]
		then break
	else
		echo "Caracter no valido"
	fi
done
exit 1

