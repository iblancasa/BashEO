#!/bin/bash

source basheo.sh


function time_mutations(){
  itera=$1
  mota=$2

  ahora=`date +%s%3N`

  for i in `seq 1 $itera`
    do
      mutie=$(mutate1 $mota)
    done

  final=`date +%s%3N`

  echo "($final-$ahora)/1000"| bc -l
}


length=16
iterations=100000
top_length=32768



while [ $length -lt $top_length ]
  do
    indi=$(random_chromosome $length)

    echo "bash-BitString "$length", "$(time_mutations $iterations $indi)
    length=$(($length*2))
  done

