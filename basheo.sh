#!/bin/bash

# Create a random chromosome
function random_chromosome(){
  for i in `seq 1 $1`
    do
      chromosome="$chromosome$[RANDOM % 2]"
    done
  echo $chromosome
}




# Computes maxOnes fitness
function compute_fitness(){
  echo $(echo "$1" | grep -o "1" | wc -l)
}


# Mutate all chromosomes in the population
function mutate1(){
  local chromosome=$1
  local mutation_point=$((RANDOM % ${#chromosome} ))
  mutie=${chromosome:0:$mutation_point}

  if [chromosome[$mutation_point]==1]; then
    mutie=$mutie""0
  else
    mutie=$mutie""1
  fi

  mutie=$mutie""${chromosome:$(($mutation_point+1)):$((${#chromosome}-$mutation_point))}
  echo $mutie
}


