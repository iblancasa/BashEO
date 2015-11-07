#!/bin/bash
declare -a chromosome



# Create a random chromosome
function random_chromosome(){
  for i in `seq 1 $1`
    do
      chromosome[$i]=$[RANDOM % 2]
    done
}

random_chromosome 10
echo ${chromosome[*]}
