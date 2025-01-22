#!/bin/bash

# Comando que te lleva a tu directorio personal
cd

# Comando que te dice la ruta donde estas
pwd

# Comando que te dice quien eres
whoami

# Crear una estructura de directorios
mkdir examen2ev
cd examen2ev
mkdir dir{1..3}
mkdir dir1/dir{11..13}
mkdir dir2/dir{21..23}
mkdir dir3/dir{31..33}

touch dir1/dir11/fich11.txt
touch dir1/dir12/fich12.txt
touch dir1/dir13/fich13.txt
touch dir1/fich1.txt

touch dir2/dir21/fich21.txt
touch dir2/dir22/fich22.txt
touch dir2/dir23/fich23.txt
touch dir2/fich2.txt

touch dir3/dir31/fich31.txt
touch dir3/dir32/fich32.txt
touch dir3/dir33/fich33.txt
touch dir3/fich3.txt


#termina primer ejercicio
clear

# Partiendo del directorio examen2ev
# Edita el contenido del fichero "fich33.txt" escribiendo tu nombre y apellidos. Usa un editor de ficheros. ruta relativa
# En mi caso usaría vi o emacs
echo "Ismael Macareno" >> dir3/dir33/fich33.txt

# Comprueba que has editado bien el fichero. Partiendo del dir examen2ev
# con ruta relativa
cat dir3/dir33/fich33.txt
# con ruta absoluta
cat /home/alumno/examen2ev/dir3/dir33/fich33.txt
cat ~/examen2ev/dir3/dir33/fich33.txt

# Ejercicio 3
# Situado en el directorio dir22
# Muestra en la shell el contenido del fichero fich33.txt usando ruta absoluta
cd dir2/dir22
cat /home/alumno/examen2ev/dir3/dir33/fich33.txt

# Muestra en la shell el contenido del fichero fich33.txt usando ruta relativa
cd dir2/dir22
cat ../../dir3/dir33/fich33.txt

# Ejercicio 4
# Partiendo del dir31 sin salir de este, usa rutas relativas para realizar lo siguiente
cd /home/alumno/examen2ev/dir3/dir31

# Crear el dir14 dentro de dir1
mkdir ../../dir1/dir14

# Borra dir14
rmdir ../../dir1/dir14

# Borra dir11 y todo su contenido
rm -rf ../../dir1/dir11

# Ejercico 5
# Partiendo del directorio dir21 y sin salir de este, usa rutas relativas
# Copia fich12.txt y fich13.txt a dir32 en un solo comando
cd ~/examen2ev/dir2/dir21
cp ../../dir1/dir12/fich12.txt ../../dir3/dir32/ || cp ../../dir1/dir13/fich13.txt ../../dir3/dir32/

# Mueve los ficheros fich12.txt y fich13.txt del dir32 al dir13. En un solo comando
mv ../../dir3/dir32/fich1*.txt ../../dir1/dir13/

# Renombra los ficheros recién movidos en el paso anterior
mv ../../dir3/dir32/fich1*.txt ../../dir1/dir13/ficherito1{4..6}.txt

# Ejercico 6
# Situado en examen2ev usando ruta relativa
# Crear un alias llamado examen2ev que realice las siguientes acciones en el orden que se pide


# Ejercicio 7
# Partiendo de examen2ev, usa rutas relativas sin salir del directorio
# Crear un fichero en dir21 llamado fichcat1.txt que tenga 3 palabras, una debajo de la otra
echo "roble\n tigre\n casa" > dir2/dir21/fichcat1.txt

# Crea un fichero en dir21 llamado fichcat2.txt que contenga tres palabras una debajo de la otra
echo "piedra\n alga\n montaña" > dir2/dir21/fichcat1.txt

# Comprueba si fichcat1.txt está ordenado, si no, ordena y guarda el nuevo fichero
sort dir2/dir21/fichcat > fichcat1ord.txt

# Muestra el contenido de fichcat1ord.txt
