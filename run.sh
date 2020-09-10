#/bin/bash

echo "Building Images"

docker build -t standard .
docker build -f Dockerfile.minimal  -t standard.minimal .

echo "Sizes of Images"

docker images | grep standard 
 
echo "Standard Image running ubi based on registry.access.redhat.com/ubi7/ubi"

rm out.txt
touch out.txt
for i in {1..10}
do 
    { time docker run --rm standard > /dev/null ; } 2> out.txt
    cat out.txt | grep real 
done

echo "Minimal Image running ubi.minimal based on registry.access.redhat.com/ubi7/ubi-minimal"
for i in {1..10}
do 
    { time docker run --rm standard.minimal > /dev/null ; } 2> out.txt
    cat out.txt | grep real 

done
rm out.txt
 



