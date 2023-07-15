#!/bin/bash
if [ "$#" != "3" ]; then
    echo "Expected number of arguments is 3, you gave $#."
    exit 0
fi

if [ "$2" == "+" ]; then
    result=$(($1 + $3))

elif [ "$2" == "-" ]; then
    result=$(($1 - $3))

elif [ "$2" == "x" ]; then
    result=$(($1 * $3))

elif [ "$2" == "/" ]; then
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

echo "$1 $2 $3 = $result"