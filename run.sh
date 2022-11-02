#!/usr/bin/env bash
  
function build () { 
    UBI=$1
    docker build -t ubi-standard.ubi$UBI  --build-arg VER=$UBI --build-arg SIZE= .
    docker build -t ubi-standard-minimal.ubi$UBI  --build-arg VER=$UBI --build-arg SIZE=-minimal .
}

function bench () { 
    UBI=$1
    echo "Running ubi-standard.ubi$UBI" 
    for i in {1..5}
    do 
        time docker run --rm ubi-standard.ubi$UBI
    done  
    echo "Running ubi-standard-minimal.ubi$UBI" 
    for i in {1..5}
    do 
        time docker run --rm ubi-standard-minimal.ubi$UBI
    done 
}

build 7
build 8
build 9   
echo "Sizes of Images"
docker images | grep ubi-standard  
bench 7
bench 8
bench 9   
  
echo "Baseline agains alpine" 
for i in {1..5}
do 
time docker run --rm alpine uname 
done
 
 



