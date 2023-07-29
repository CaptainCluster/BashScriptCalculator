#!/bin/bash

#CaptainCluster https://github.com/CaptainCluster

#This if-condition makes sure that the user inserts precisely
#three arguments. The way these arguments work are explained
#clearly in the README file.
if [ "$#" != "3" ]; then
    echo "Expected number of arguments is 3, you gave $#."
    exit 0
fi

#These conditions make sure that the 2nd argument, the operator,
#is a valid one. If the operator is +, it should obviously 
#perform an addition. 
if [ "$2" == "+" ]; then
    result=$(($1 + $3))

elif [ "$2" == "-" ]; then
    result=$(($1 - $3))

elif [ "$2" == "x" ]; then
    result=$(($1 * $3))

elif [ "$2" == "/" ]; then
    #We handle the "zero as a divider" exception here
	if [ $3 -eq 0 ]; then
        echo "Can not divide with 0."
	    exit 1
    fi
    result=$(($1 / $3))
    remainder=$(($1 % $3))
    if [ "$remainder" != "0" ]; then
        echo "$1 $2 $3 = $result with remainder $remainder"
        exit 1
    fi

elif [ "$2" == "^" ]; then
    result=$(($1 ** $3))

elif [ "$2" == "%" ]; then
    result=$(($1 % $3))

else
    echo "Invalid operator, supports +, -, x,  /, ^ and % operators."
    exit -3
fi

#The calculation and its result will be displayed to the user
echo "$1 $2 $3 = $result"