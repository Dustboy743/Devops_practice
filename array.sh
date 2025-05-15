#!/bin/bash

movies=("hello" "laila" "king")

echo "first movie is ${movies[0]}"
echo "second movie is ${movies[1]}"
echo "all movies is ${movies[@]}"
#echo "out of range movies is ${movies[4]}"
echo "lenght of movies is ${#movies[@]}"