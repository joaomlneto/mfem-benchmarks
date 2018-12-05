#!/usr/bin/env bash

red=`tput setaf 1`
reset=`tput sgr0`

ROOT="$(dirname "`pwd`")"
HYPRE_DIR=$ROOT/hypre-2.10.0b
METIS_DIR=$ROOT/metis-4.0
MFEM_DIR=$ROOT/mfem-3.4

# remove previous folders if they exist
echo "${red}removing previous versions${reset}"
rm -rf $HYPRE_DIR $METIS_DIR $MFEM_DIR

# go back to the root of the repository
cd ..

# download and extract hypre 2.10.0b
echo "${red}downloading hypre 2.10.0b...${reset}"
wget https://computation.llnl.gov/projects/hypre-scalable-linear-solvers-multigrid-methods/download/hypre-2.10.0b.tar.gz
tar xzvf hypre-2.10.0b.tar.gz > /dev/null
rm -f hypre-2.10.0b.tar.gz

# download and extract metis 4.0.3
echo "${red}downloading metis 4.0.3...${reset}"
wget http://glaros.dtc.umn.edu/gkhome/fetch/sw/metis/metis-4.0.3.tar.gz
tar xzvf metis-4.0.3.tar.gz > /dev/null
mv metis-4.0.3 metis-4.0
rm -f metis-4.0.3.tar.gz

# download and extract mfem 3.4
echo "${red}downloading mfem 3.4...${reset}"
wget https://github.com/mfem/mfem/archive/v3.4.tar.gz
tar xzvf v3.4.tar.gz > /dev/null
rm -f v3.4.tar.gz

echo "${red}compiling hypre...${reset}"
cd $HYPRE_DIR/src
./configure --with-openmp > /dev/null
make install -j -s

echo "${red}compiling metis...${reset}"
cd $METIS_DIR
make -j -s

echo "${red}compiling mfem...${reset}"
cd $MFEM_DIR
# configure mfem to use openmp
cp $MFEM_DIR/config/defaults.mk $MFEM_DIR/config/user.mk
make config MFEM_USE_MPI=NO MFEM_DEBUG=NO MFEM_USE_OPENMP=YES MFEM_THREAD_SAFE=YES
make status
make all -j -s
make status
