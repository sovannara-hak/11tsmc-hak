#!/bin/zsh
NUM_ITER=0

cat $1 \
| sed "s:OUTFILE:/home/shak/data/jointReconstructionPlot/observation/plot/R/traceSotIdEfiting/taskLhandNormInvJerr_0:" \
| sed "s:RESIDUE:2.91966:" \
| sed "s:MOTIONNORM:0.177583:" \
| sed "s:DATAFILE:/home/shak/data/jointReconstructionPlot/observation/plot/R/traceSotIdEfiting/taskLhandNormInvJerr_0.dat:g" \
| sed "s:TASK:taskLhand:g" \
| gnuplot -persist
