#!/bin/bash

dest=$1
#for i in 1 
#for i in 1 2 4 8 16 
for i in 1 2 4 8 16 32 64 128 256 512 1024 2048 3072 
do 
  cd gb_no_$i
  echo $i
  rm -rf A*
  mv *.output ../$dest
  cd ..
done
cd $dest
for i in `ls`
do
  p=`grep 'of proc' $i | awk '{ print $4 }'`
  n=`bc <<< $p/64`
  echo Nodes=$n
  #grep -B1 -A7 cggo $i | grep -v 'cggo time' | grep -B1 -A7 -m 1 cggo
  grep -B1 -A11 cggo $i | grep -v 'cggo time' | tail -n13
  echo ------------------------
done
cd ..


