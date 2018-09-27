#!/usr/bin/env bash

cpubindings=("0-7" "0-15" "0-23" "0-31" "0-39" "0-47")
numcpus=(8 16 24 32 40 48)

run_cmd () {
  echo ${red}$1${reset}
  $1
}

if [[ ${#cpubindings[@]} -ne ${#numcpus[@]} ]]; then
	echo "error: cpubindings and numcpus need to be same size"
	exit
fi

echo executable and args: "$@"

red=`tput setaf 1`
reset=`tput sgr0`

for (( i=0; i<${#cpubindings[@]}; i++ ));
do
  echo -e "${red}#CPUs: ${numcpus[$i]} \tCPUs bound: ${cpubindings[$i]} ${reset}"
  run_cmd "time numactl --physcpubind=${cpubindings[$i]} mpirun -np ${numcpus[$i]} $@"
  run_cmd "time numactl --physcpubind=${cpubindings[$i]} --interleave=all mpirun -np ${numcpus[$i]} $@"
done

