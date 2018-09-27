#!/usr/bin/env bash

ROOT="$(dirname "`pwd`")"
MFEM_DIR=$ROOT/mfem-3.4

(cd $MFEM_DIR/miniapps/performance/ && ./ex1)
