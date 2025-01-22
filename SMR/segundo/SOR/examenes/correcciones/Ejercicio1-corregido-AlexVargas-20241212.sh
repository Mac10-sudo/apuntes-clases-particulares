#!/bin/bash
echo "		Menu"
echo "----------------------------"
echo "1. Dispositivos conectados"
echo "2. Listar la home del usuario"
echo "3. Listar SOLO inodos"
echo "4. Crear un enlace (submenu)"
echo "5. Buscar el proceso con el PID mas elevado"
echo "6. Numero de procesos ejecutados desde el inicio"
echo "7. Mostrar todo el arbol de procesos"
echo "8. Mostrar usuarios conectados"
echo "9. Crear tantos ficheros como quiera el usuario (con el mismo nombre)"
echo "10. Fecha (Submenu)"
echo "11. Ficheros importantes (Submenu)"
echo "12. exit"
read opc

case $opc in
	1)df -h #Esta mal, df -h | awk '{print $1}'
	;;
	2)ls -l $HOME #Hubiese sido más coqueto ls -latr
	;;
	3)ls -li $HOME | cut -d" " -f1
	;;
	4)	echo "1. Enlace Simbolico"
		echo "2. Enlace Duro"
		read opt
		
		case $opt in
			1)	echo "Introduce la ruta de TARGET"
				read target
				echo "Introduce la ruta de DIRECTORY"
				read directory
				ln -s "$target" "$directory"
			;;
			2)	echo "Introduce la ruta de TARGET"
				read target1
				echo "Introduce la ruta de DIRECTORY"
				read directory1
				ln "$target1" "$directory1"
			;;
		esac
	;;
	5)htop #Esto está fatal, no se deberían meter programas como este en scripts, además, pido el PID mas elevado, htop saca todos los procesos
	;;
	6)cat /proc/stat | grep processes
	;;
	7)pstree
	;;
	8)who
	;;
	9)	echo "Cuantos ficheros quieres crear?"
		read fic
		# Este bucle no va [./Ejercicio1.sh: line 55: ((: i=: syntax error: operand expected (error token is "=")]
		for ((i=1; i=$num; i=i+1))
			do
				echo "Dime el contenido del fic$i"
				read con
				echo "$con" > fic$i.txt
				echo "Este es el contenido"
				cat fic$i.txt
			done
	;;
	10)	echo "1. Fecha Completa"
		echo "2. Fecha"
		echo "3. Hora"
		echo "4. Dia de la Semana"
		echo "5. Mes"
		echo "6. Año"
		read op
		# Esto si se hubiese revisado el man de date se podría haber apreciado que se puede hacer con X opciones del comando
		case $op in
			1)date
			;;
			2)date | cut -d" " -f4
			;;
			3)date | cut -d" " -f5
			;;
			4)date | cut -d" " -f2
			;;
			5)date | cut -d" " -f3
			;;
			6)date | cut -d" " -f4
			;;
		esac
	;;
	11)	echo "1. Usuarios"
		echo "2. Hashes Contraseñas"
		read usu
		
		case $usu in
			1)cat /etc/passwd | cut -d; - #Esto no va
			;;
			2)sudo cat /etc/shadow #me saca todo, no solo hashes
			;;
		esac
	;;
	12)echo "Gracias por ejecutar"
	exit
	;;
	*)echo "Opcion Incorrecta"
	;;
esac				
