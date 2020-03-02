mkdir Datos
cd Datos
curl -O http://files.grouplens.org/datasets/movielens/ml-1m.zip
unzip ml-1m.zip
rm -r ml-1m.zip
cp -r ml-1m ml-1m.1
ls -l ml-1m ml-1m.1
