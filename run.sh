echo "Building Images"

docker build -t standard .
docker build -f Dockerfile.minimal  -t standard.minimal .

echo "Sizes of Images"

docker images | grep standard 
 
echo "Standard Image running ubi based on registry.access.redhat.com/ubi7/ubi"

for i in {1..10}
do 
time docker run --rm standard
done

echo "Minimal Image running ubi.minimal based on registry.access.redhat.com/ubi7/ubi-minimal"
for i in {1..10}
do 
time docker run --rm standard.minimal 
done
 



