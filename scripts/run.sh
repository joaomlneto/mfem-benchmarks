#!/usr/bin/env bash

ROOT="$(dirname "`pwd`")"
SCRIPTS_DIR=$ROOT/scripts
MFEM_DIR=$ROOT/mfem-3.4

(cd $MFEM_DIR/miniapps/performance/ && $SCRIPTS_DIR/check-omp.sh ./ex1)
(cd $MFEM_DIR/examples/ && $SCRIPTS_DIR/check-omp.sh ./ex2 -o 3)
(cd $MFEM_DIR/examples && $SCRIPTS_DIR/check-omp.sh ./ex3 -o 2)
(cd $MFEM_DIR/examples && $SCRIPTS_DIR/check-omp.sh ./ex4 -o 2)
(cd $MFEM_DIR/examples && $SCRIPTS_DIR/check-omp.sh ./ex5 -o 2 -no-vis)
(cd $MFEM_DIR/examples && $SCRIPTS_DIR/check-omp.sh ./ex6 -no-vis)
(cd $MFEM_DIR/examples && $SCRIPTS_DIR/check-omp.sh ./ex7 -o 4 -r 5 -no-vis)
(cd $MFEM_DIR/examples && $SCRIPTS_DIR/check-omp.sh ./ex8 -o 4 -no-vis)
(cd $MFEM_DIR/examples && $SCRIPTS_DIR/check-omp.sh ./ex9 -o 6 -no-vis)
(cd $MFEM_DIR/examples && $SCRIPTS_DIR/check-omp.sh ./ex10 -o 5 -no-vis)
(cd $MFEM_DIR/examples && $SCRIPTS_DIR/check-omp.sh ./ex14 -no-vis)
(cd $MFEM_DIR/examples && $SCRIPTS_DIR/check-omp.sh ./ex15 -tf 0.2 -no-vis)
(cd $MFEM_DIR/examples && $SCRIPTS_DIR/check-omp.sh ./ex16 -o 5 -no-vis -no-visit)
(cd $MFEM_DIR/examples && $SCRIPTS_DIR/check-omp.sh ./ex17 -o 2 -no-vis)
(cd $MFEM_DIR/examples && $SCRIPTS_DIR/check-omp.sh ./ex18 -no-vis)
(cd $MFEM_DIR/examples && $SCRIPTS_DIR/check-omp.sh ./ex19 -o 3 -no-vis)
