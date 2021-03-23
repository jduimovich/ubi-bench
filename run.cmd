echo "Building Images"

docker build -t ubi-standard.ubi7  --build-arg VER=7 --build-arg SIZE= .
docker build -t ubi-standard-minimal.ubi7  --build-arg VER=7 --build-arg SIZE=-minimal .

docker build -t ubi-standard.ubi8  --build-arg VER=8 --build-arg SIZE= .
docker build -t ubi-standard-minimal.ubi8  --build-arg VER=8 --build-arg SIZE=-minimal .
 

echo "Sizes of Images"

docker images | grep ubi-standard 
  