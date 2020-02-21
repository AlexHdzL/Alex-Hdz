mkdir Preparacion-datos
cd Preparacion-datos
cp -a ../users-h.csv .
sed "s/,/;/g" users-h.csv > users.csv #Se reemplaza la , por ; y se crea un nue>
rm users-h.csv #Se elimina el archivo original
grep F users.csv > users-F.csv #Se crea un archivo sólo con los registros femen>
grep M users.csv > users-M.csv #Se crea un archivo sólo con los registros mascu>
sed "s/M/MAS/g" users-M.csv > users-MAS.csv | wc #Se sustituye M por MAS y se c>
sed "s/F/FEM/g" users-F.csv > users-FEM.csv | wc #Se sustituye F por FEM y se c>
rm users-M.csv users-F.csv #Se eliminan los archivos F y M
head -n 3 users-MAS.csv #Se muestran las 3 primeras líneas del archivo
wc users-MAS.csv
head -n 3 users-FEM.csv #Se muestran las 3 primeras líneas del archivo
wc users-FEM.csv
ls -l
