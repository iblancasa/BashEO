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

}


chromosome=$(random_chromosome 10)
ones=$(compute_fitness 1001)
echo $ones

