#!/bin/bash
declare -a chromosome_return



# Create a random chromosome
function random_chromosome(){
  for i in `seq 1 $1`
    do
      chromosome_return[$i]=$[RANDOM % 2]
    done
}


# Computes maxOnes fitness
function compute_fitness(){
  ones=0
  local array=$1[@]
  for i in ${!array}
    do
      ones=$((ones + i))
    done
    return $ones
}

# Mutate all chromosomes in the population
function compute_fitness(){
}


random_chromosome 10
echo ${chromosome_return[*]}
compute_fitness chromosome_return
echo $?
