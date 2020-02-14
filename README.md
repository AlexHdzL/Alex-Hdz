# POSTWORK03
# I.Procedimiento antes de conectarse al servidor
- a)Preparar la base de datos
- b)Explicar la base de datos:
- -Es una base de datos descargada del Catalogo de sismos-Servicio Sismologico Nacional(SSN), UNAM-Mexico.
-Contiene todos los sismos registrados desde 1900 al 13 de febrero del 2020, cuya magnitud es mayor o igual a 3 grados en escala richter.
-Datos de la tabla:
--id=identificador del sismo.
--Mag=magnitud en escala richter.
--Prof=profundidad en kilometros.
--Loc=la localizacion es solo una referencia a una localidad importante en cuanto a numero de habitantes y cercana al epicentro.
--Edo=estado de la Republica Mexicana donde ocurrio el sismo.
--Fecha=fecha de registro.
--Estatus= Los registros con estatus verificado son los calculados y publicados de manera oportuna por al menos un analista de sismogramas. Los registros obtienen estatus revisado cuando se realiza un analisis, de ser posible, con mas y mejores datos para el calculo de parametros y cuyo tiempo de publicacion es variable.
# II.Procedimiento después de conectarse al servidor
a)Conectarse al servidor
>mycli -h ec2-34-219-168-150.us-west-2.compute.amazonaws.com -u root -p bedu0583 -P 3306 --local-infile true
b)Crear base de datos
>CREATE DATABASE AlejandroHdz;
c)Usar base de datos
>USE AlejandroHdz;
d)Crear tabla
>CREATE TABLE sismos (id int primary key, Mag decimal(2,1), Prof int, Loc varchar(100), Edo varchar(5), Fecha date, Estatus varchar(20));  
e)Describir tabla
>DESCRIBE sismos;
+---------+--------------+------+-----+---------+-------+
| Field   | Type         | Null | Key | Default | Extra |
+---------+--------------+------+-----+---------+-------+
| id      | int(11)      | NO   | PRI | <null>  |       |
| Mag     | decimal(2,1) | YES  |     | <null>  |       |
| Prof    | int(11)      | YES  |     | <null>  |       |
| Loc     | varchar(100) | YES  |     | <null>  |       |
| Edo     | varchar(5)   | YES  |     | <null>  |       |
| Fecha   | date         | YES  |     | <null>  |       |
| Estatus | varchar(20)  | YES  |     | <null>  |       |
+---------+--------------+------+-----+---------+-------+
# III.Preguntas sobre la base de datos
1.¿Cuántos sismos hay registrados en esta base de datos?
>select mag, count(mag) AS Magnitudes from sismos group by mag order by Mag asc;
+----------+
| count(*) |
+----------+
| 167238   |
+----------+

¿Cuáles son las magnitudes de los sismos de esta tabla y cuántos sismos hay ?
>select mag, count(mag) AS Magnitudes from sismos group by mag order by Mag asc;
+-----+------------+
| mag | Magnitudes |
+-----+------------+
| 3.0 | 2661       |
| 3.1 | 4252       |
| 3.2 | 6857       |
| 3.3 | 9815       |
| 3.4 | 13567      |
| 3.5 | 17896      |
| 3.6 | 20611      |
| 3.7 | 21230      |
| 3.8 | 19927      |
| 3.9 | 16065      |
| 4.0 | 11357      |
| 4.1 | 7054       |
| 4.2 | 4542       |
| 4.3 | 2903       |
| 4.4 | 2069       |
| 4.5 | 1538       |
| 4.6 | 1199       |
| 4.7 | 899        |
| 4.8 | 618        |
| 4.9 | 510        |
| 5.0 | 382        |
| 5.1 | 258        |
| 5.2 | 196        |
| 5.3 | 160        |
| 5.4 | 88         |
| 5.5 | 102        |
| 5.6 | 69         |
| 5.7 | 41         |
| 5.8 | 39         |
| 5.9 | 25         |
| 6.0 | 37         |
| 6.1 | 22         |
| 6.2 | 14         |
| 6.3 | 9          |
| 6.4 | 14         |
| 6.5 | 36         |
| 6.6 | 25         |
| 6.7 | 29         |
| 6.8 | 14         |
| 6.9 | 24         |
| 7.0 | 19         |
| 7.1 | 13         |
| 7.2 | 9          |
| 7.3 | 9          |
| 7.4 | 9          |
| 7.5 | 7          |
| 7.6 | 9          |
| 7.7 | 1          |
| 7.8 | 3          |
| 7.9 | 1          |
| 8.0 | 1          |
| 8.1 | 1          |
| 8.2 | 2          |
+-----+------------+
3.Si a partir de los 6 grados de magnitud en escala richter un sismo se convierte en un terremoto, ¿cuántos terremotos registrados han pasado en México?
>select count(*) from sismos where mag > 5.9;
+----------+
| count(*) |
+----------+
| 308      |
+----------+
4.¿Cuántos terremotos superiores a 7.5 grados de magnitud han ocurrido en México, en dónde y en qué fecha se produjeron?; ordenar por fecha
>select mag,loc,fecha from sismos where mag > 7.5 order by fecha;
+-----+-----------------------------------------+------------+
| mag | loc                                     | fecha      |
+-----+-----------------------------------------+------------+
| 7.7 | 5 km al SUROESTE de TEOPISCA            | 1902-09-23 |
| 7.6 | 50 km al SUR de MAPASTEPEC              | 1903-01-13 |
| 7.6 | 23 km al SURESTE de SAN MARCOS          | 1907-04-15 |
| 7.6 | 59 km al SUROESTE de CD LAZARO CARDENAS | 1911-06-07 |
| 7.6 | 11 km al OESTE de MIAHUATLAN            | 1928-06-16 |
| 7.8 | 30 km al OESTE de MIAHUATLAN            | 1931-01-14 |
| 8.2 | 4 km al SURESTE de CASIMIRO CASTILLO    | 1932-06-03 |
| 7.8 | 14 km al SUROESTE de TUXPAN             | 1932-06-18 |
| 7.6 | 25 km al NORESTE de COALCOMAN           | 1941-04-15 |
| 7.9 | 93 km al ESTE de CD HIDALGO             | 1942-08-06 |
| 7.8 | 47 km al NORESTE de SAN MARCOS          | 1957-07-28 |
| 7.6 | 43 km al SURESTE de COALCOMAN           | 1973-01-30 |
| 7.6 | 32 km al NOROESTE de S PEDRO POCHUTLA   | 1978-11-29 |
| 8.1 | 45 km al NOROESTE de LA MIRA            | 1985-09-19 |
| 7.6 | 25 km al NOROESTE de ZIHUATANEJO        | 1985-09-20 |
| 8.0 | 10 km al SURESTE de MANZANILLO          | 1995-10-09 |
| 7.6 | 46 km al SUROESTE de CD DE ARMERIA      | 2003-01-21 |
| 8.2 | 140 km al SUROESTE de PIJIJIAPAN        | 2017-09-07 |
+-----+-----------------------------------------+------------+
5.-¿Dónde, en qué fecha y a qué profundidad se produjeron los terremetos cuya magnitud supero los 7.9 grados?; ordenar por magnitud
>select loc,fecha,prof,mag from sismos where mag > 7.9 order by mag;
+--------------------------------------+------------+------+-----+
| loc                                  | fecha      | prof | mag |
+--------------------------------------+------------+------+-----+
| 10 km al SURESTE de MANZANILLO       | 1995-10-09 | 25   | 8.0 |
| 45 km al NOROESTE de LA MIRA         | 1985-09-19 | 15   | 8.1 |
| 4 km al SURESTE de CASIMIRO CASTILLO | 1932-06-03 | 33   | 8.2 |
| 140 km al SUROESTE de PIJIJIAPAN     | 2017-09-07 | 46   | 8.2 |
+--------------------------------------+------------+------+-----+
6.-Extraer los datos de la pregunta 5 en un archivo.csv
AlejandroHdz> \T csv
Changed table format to csv
Time: 0.000s
AlejandroHdz> \o Sismos-mas-fuertes-Mexico.csv
Time: 0.000s
AlejandroHdz> \T psql
Changed table format to psql
