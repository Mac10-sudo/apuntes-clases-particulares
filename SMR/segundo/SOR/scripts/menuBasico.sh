#!/bin/bash
opt=1
while [ "$opt" != 12 ]
do
#clear

echo "                       Menu"
echo "--------------------------------------------"
echo "           1. Dispositivos conectados"
echo "           2. Listar la home del usuario"
echo "           3. Listar SOLO inodos"
echo "           4. Crear un enlace (submenu)"
echo "           5. Buscar el proceso con el PID mas elevado"
echo "           6. Numero de procesos ejecutados desde el inicio"
echo "           7. Mostrar el arbol de procesos"
echo "           8. Mostrar usuarios conectados"
echo "           9. Crear tantos ficheros como quiera el usuario (con el mismo nombre)"
echo "           10. Fecha (submenu)"
echo "           11. Ficheros importantes (submenu)"
echo "           12. exit"
echo "Escoge una opcion [1-12]: "
read opt

case $opt in
	1)
		df -h | awk '{print $1}'
		 ;;
	2)
		ls -latr $HOME
		;;
	3)
		ls -li $HOME | awk '{print $1}'
		;;
	4)
		clear
		echo "1. Enlace simbolico"
		echo "2. Enlace duro"
		echo "Escoge tu opcion [1-2]: "
		
		read optSubUno
		
		case $optSubUno in
			1)
				echo "TARGET (ruta completa): "
				read $targetSubUno
				echo "DIRECTORY (ruta completa): "
				read $directorySubUno
				ln -s $targetSubUno $directorySubUno
				;;
			2)
				echo "TARGET (ruta completa): "
				read $targetSubUno
				echo "DIRECTORY (ruta completa): "
				read $directorySubUno
				ln $targetSubUno $directorySubUno
				;;
			*)
				echo "Te has equivocado, me retiro"
				exit
				;;
		esac
		;;
	5)
		ps -ef | awk '{print $2}' | sort -g | tail -1
		;;
	6)
		cat /proc/stat | grep processes
		;;
	7)
		pstree
		;;
	8)
		who
		;;
	9)
		echo "Cuantos ficheros quieres crear: "
		read numFic
		
		for ((i=1;i<="$numFic";i=i+1))
		do
			echo "Texto para el fichero $i"
			read textoFich
			echo "$textoFich" > Fichero"$i".txt
			echo "Fichero$i creado"
		done
		;;
	10)
		clear
		echo "Menu Fecha"
		echo "-----------------------"
		echo "1. Dar Fecha Completa"
		echo "2. Dar solo Fecha"
		echo "3. Dar solo Hora"
		echo "4. Día de la semana"
		echo "5. Mes del año"
		echo "6. Año"
		echo "Dame tu opcion [1-6]: "
		read optDate
		
		case $optDate in
			1)
				date
				;;
			2)
				date '+%Y-%m-%d'
				;;
			3)
				date '+%H:%M:%S'
				;;
			4)
				date '+%d'
				;;
			5)
			    date '+%m'
			    ;;
			6)
			    date '+%Y'
			    ;;
		esac
		;;
	11)
	    clear
	    echo "Ficheros Importantes"
	    echo "--------------------"
	    echo "1. Ver usuarios"
	    echo "2. Ver Hashes passwd"
	    echo "Escoge tu opcion [1-2]: "
	    read optFicImp

	    case $optFicImp in
		1)
		    cat /etc/passwd | cut -d ":" -f 1
		    ;;
		2)
		    cat /etc/shadow | cut -d ":" -f 2
		    ;;
	    esac
	    ;;
	12)
		echo "Gracias por ejecutarme"
		sleep 2
		exit
		;;
esac
done
