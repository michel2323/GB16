#!/bin/sh  

#­-A GasJetsCyl_tesp
PROC_PER_NODE=62
EXE=nek5000 
echo "Running Cobalt Job $COBALT_JOBID."

#aprun -n $((COBALT_JOBSIZE*PROC_PER_NODE)) -N $PROC_PER_NODE numactl --membind 1 $EXE
#aprun -n $((COBALT_JOBSIZE*PROC_PER_NODE)) -N $PROC_PER_NODE $EXE
#aprun -r 2 --p-state=1100000 -n 64 -N 64 numactl --membind=1 ./nek5000
#aprun -r 2 -n 64 -N 62 numactl --membind=1 ./nek5000
#aprun -r 2 -n 64 -N 62 ./nek5000
aprun -r 2 -n 64 -N 62 numactl --membind=1 ./nek5000

EXIT_STATUS=$? 
echo "Job $COBALT_JOBID completed." 
exit $EXIT_STATUS

