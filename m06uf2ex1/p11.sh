#!/bin/bash
clear
if (( EUID != 0 ))
then
  echo "Aquest script s'ha d'executar amb prilegis de l'usuari root"
  exit 1 
fi
wget http://www.collados.org/asix2/m06/uf2/alumnes.ods
libreoffice --convert-to csv --outdir . usuaris.ods > /dev/null 2>&1

#!/bin/bash
clear

echo -n "Indica la quantitat d'usuaris [1-100]: "
read qt
if [[ $qt -lt 1 ]] || [[ $qt -gt 100 ]]
then
	echo "Valor incorrecte. Ha d'estar entre 1 i 100"
	exit 1
fi
echo -n "Indica el valor inicial de l'uidNumber: "
read vinic

echo -n "Introdueix la contrasenya admin del ldap: "  
read -s ctsAdm
echo

if [[ -e ctsUsuaris.txt ]]
then
    rm ctsUsuaris.txt
fi

NumUsr=$vinic
for (( i=1; i<=$qt; i++))

do
    idUsr=usr$NumUsr
    uo="UsuarisGrups"
    grp="UsuarisDomini"

    echo "$idUsr ------ $ctsnya_usr" >> ctsUsuaris.txt
	echo "objectClass: shadowAccount" >> ctsUsuaris.txt
    echo "objectClass: userPassword" >> ctsUsuaris.txt
    ((NumUsr++))
done

echo "Done!"
exit 0
