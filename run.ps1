echo "Building Images"

docker build -t standard .
docker build -f Dockerfile.minimal  -t standard.minimal .

echo "Sizes of Images"

docker images | grep standard 
 

echo "Standard Image running ubi based on registry.access.redhat.com/ubi7/ubi"

$i=1
While ($i -lt 10)
{
	Measure-Command {docker run --rm standard} | grep TotalMilliseconds
	$i++
}

echo "Minimal Image running ubi.minimal based on registry.access.redhat.com/ubi7/ubi-minimal"
$i=1
While ($i -lt 10)
{
	Measure-Command {docker run --rm standard.minimal} | grep TotalMilliseconds
	$i++
}
