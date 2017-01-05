#!/bin/bash


#for i in 1 
#for i in 1 2 4 8 16  
#for i in 32 64 128 256 512 1024 2048 3072
for i in 1 2 4 8 16 32 64 128 256 512 1024 2048 3072
do
  echo "---------------"
  echo $i
  n=`bc <<< $i*64`
  p=`bc <<< "( $n + 64 )/62"`
  n1=`bc <<< $p*62`
  diff=`bc <<< $n1-$n`
  echo "Number of nodes requested $p"
  echo "Number of processes $n"
  echo "Max. number of processes $n1"
  echo "Difference between max. and number of processes $diff"
  cp run.sh ./gb_no_$i
  cd gb_no_$i
  sed -i "s/-n 64/-n $n/" run.sh
  qsub -t 15 -n $p -A GasJetsCyl_tesp -q flat-quad run.sh
  cd ..
done
sleep 2
qstat -u mschanen


