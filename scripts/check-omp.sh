#!/usr/bin/env bash

cpubindings=("0-7" "0-15" "0-23" "0-31" "0-39" "0-47")

run_cmd () {
  echo ${red}$1${reset}
  $1
}

echo executable and args: "$@"

red=`tput setaf 1`
reset=`tput sgr0`

for (( i=0; i<${#cpubindings[@]}; i++ ));
do
  echo -e "${red}#CPUs: ${numcpus[$i]} \tCPUs bound: ${cpubindings[$i]}${reset}"
  run_cmd "time numactl --physcpubind=${cpubindings[$i]} $@"
  run_cmd "time numactl --physcpubind=${cpubindings[$i]} --interleave=all $@"
done
