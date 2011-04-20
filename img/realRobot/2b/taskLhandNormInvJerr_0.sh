#!/bin/zsh
NUM_ITER=0

cat $1 \
| sed "s:OUTFILE:/home/shak/data/jointReconstructionPlot/observation/plot/RL/tmp/taskLhandNormInvJerr_0:" \
| sed "s:RESIDUE:0.943069:" \
| sed "s:MOTIONNORM:0.172176:" \
| sed "s:DATAFILE:/home/shak/data/jointReconstructionPlot/observation/plot/RL/tmp/taskLhandNormInvJerr_0.dat:g" \
| sed "s:TASK:taskLhand:g" \
| gnuplot -persist
