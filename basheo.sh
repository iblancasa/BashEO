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
    string=$1
    ones=${string//0/}
    echo ${#ones}
}


# Mutate all chromosomes in the population
function mutate1(){
  local chromosome=$1
  local mutation_point=$((RANDOM % ${#chromosome} ))
  mutie=${chromosome:0:$mutation_point}

  if [ ${chromosome:$mutation_point:1} -eq 1 ]; then
    mutie=$mutie""0
  else
    mutie=$mutie""1
  fi

  mutie=$mutie""${chromosome:$(($mutation_point+1)):$((${#chromosome}-$mutation_point))}
  echo $mutie

}

# Crossover
function crossover(){
  chrom1=$1
  chrom2=$2

  length=${#chrom1}
  xover_point=$((RANDOM % $length ))
  scope=$((1+$((RANDOM % $(($length-$xover_point)) ))))

  new_chrom1=${chrom1:0:$xover_point}
  new_chrom2=${chrom2:0:$xover_point}

  new_chrom1=$new_chrom1""${chrom2:$xover_point:$(($xover_point+$scope))}
  new_chrom2=$new_chrom2""${chrom1:$xover_point:$(($xover_point+$scope))}

  new_chrom1=$new_chrom1""${chrom1:$(($xover_point+$scope)):$(($length-1))}
  new_chrom2=$new_chrom2""${chrom2:$(($xover_point+$scope)):$(($length-1))}

  echo $new_chrom1" "$new_chrom2
}

