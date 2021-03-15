#!/usr/bin/env bash

echo "Building Images"

docker build -t ubi-standard.ubi7  --build-arg VER=7 --build-arg SIZE= .
docker build -t ubi-standard-minimal.ubi7  --build-arg VER=7 --build-arg SIZE=-minimal .

docker build -t ubi-standard.ubi8  --build-arg VER=8 --build-arg SIZE= .
docker build -t ubi-standard-minimal.ubi8  --build-arg VER=8 --build-arg SIZE=-minimal .
 
echo "Sizes of Images"

docker images | grep ubi-standard 
 
echo "Running ubi-standard.ubi7"

for i in {1..5}
do 
time docker run --rm ubi-standard.ubi7
done
 
echo "Running ubi-standard-minimal.ubi7"

for i in {1..5}
do 
time docker run --rm ubi-standard-minimal.ubi7
done

echo "Running ubi-standard.ubi8" 
for i in {1..5}
do 
time docker run --rm ubi-standard.ubi8
done

echo "Running ubi-standard-minimal.ubi8" 
for i in {1..5}
do 
time docker run --rm ubi-standard-minimal.ubi7
done
 
 echo "Running alpine" 
for i in {1..5}
do 
time docker run --rm alpine uname 
done
 
 



