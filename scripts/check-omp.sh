#!/usr/bin/env bash

#cpubindings=("0-7" "0-15" "0-23" "0-31" "0-39" "0-47")
cpubindings=("0-47" "0-39" "0-31" "0-23" "0-15" "0-7")

run_cmd () {
  echo ${red}$@${reset}
  $@ >/dev/null
}

echo executable and args: "$@"

red=`tput setaf 1`
reset=`tput sgr0`

for (( i=0; i<${#cpubindings[@]}; i++ ));
do
  echo -e "${red}#CPUs: ${numcpus[$i]} \tCPUs bound: ${cpubindings[$i]}${reset}"
  run_cmd "/usr/bin/time -f%e numactl --physcpubind=${cpubindings[$i]} $@"
  run_cmd "/usr/bin/time -f%e numactl --physcpubind=${cpubindings[$i]} --interleave=all $@"
done
