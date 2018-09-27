#!/usr/bin/env bash

ROOT="$(dirname "`pwd`")"
SCRIPTS_DIR=$ROOT/scripts
MFEM_DIR=$ROOT/mfem-3.4

(cd $MFEM_DIR/miniapps/performance/ && $SCRIPTS_DIR/check-mpi.sh ./ex1p)
