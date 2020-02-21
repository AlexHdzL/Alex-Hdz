mkdir Proyecto-01-Postwork02 #Se crea la carpeta correspondiente al 2do postwork
cd Proyecto-01-Postwork02 #Se ubica en la carpeta del proyecto 01
cp -a ../../Introduccion-a-Bases-de-Datos/Sesion-02/Reto-01/Datos/ml-1m . #Se copia la carpeta del reto 2
cp -r ml-1m ml-1m.1 #Se hace una copia de la carpeta de trabajo
cd ml-1m #Se ubica en la carpeta de trabajo
rm movies.csv movies.dat users.dat users.csv ratings.dat ratings.csv movies-h.csv ratings-h.csv #Se eliminan los archivos que no se van a usar
ls -l #Se listan los archivos con los que se va a trabajar
