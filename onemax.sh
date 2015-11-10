#!/bin/bash

source basheo.sh


function time_onemax(){
    itera=$1
    length=$2
    ahora=`date +%s%3N`
    
    for i in `seq 1 $itera`
    do
	mota=$(random_chromosome $length)
	fitness=$(compute_fitness $mota)
    done
    
    final=`date +%s%3N`
    
    echo "($final-$ahora)/1000"| bc -l
}


length=16
iterations=100000
top_length=32768


while [ $length -lt $top_length ]
do
    
    echo "bash-BitString "$length", "$(time_onemax $iterations $length)
    length=$(($length*2))
  done

