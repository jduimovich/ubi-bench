echo "Building Images"

docker build -t ubi-standard.ubi7  --build-arg VER=7 --build-arg SIZE= .
docker build -t ubi-standard-minimal.ubi7  --build-arg VER=7 --build-arg SIZE=-minimal .

docker build -t ubi-standard.ubi8  --build-arg VER=8 --build-arg SIZE= .
docker build -t ubi-standard-minimal.ubi8  --build-arg VER=8 --build-arg SIZE=-minimal .
 

echo "Sizes of Images"

docker images | grep ubi-standard 
 
echo "Bench: ubi-standard.ubi7"

$limit=5
$i=1
While ($i -lt $limit)
{
	Measure-Command {docker run --rm ubi-standard.ubi7} | grep TotalMilliseconds
	$i++
}

echo "Bench: ubi-standard.ubi8"
$i=1
While ($i -lt $limit)
{
	Measure-Command {docker run --rm ubi-standard.ubi8} | grep TotalMilliseconds
	$i++
}

echo "Bench: ubi-standard-minimal.ubi7"
$i=1
While ($i -lt $limit)
{
	Measure-Command {docker run --rm ubi-standard-minimal.ubi7} | grep TotalMilliseconds
	$i++
}
echo "Bench: ubi-standard-minimal.ubi8"
$i=1
While ($i -lt $limit)
{
	Measure-Command {docker run --rm ubi-standard-minimal.ubi8} | grep TotalMilliseconds
	$i++
}
 
echo "Bench: alpine"
$i=1
While ($i -lt $limit)
{
	Measure-Command {docker run --rm alpine uname} | grep TotalMilliseconds
	$i++
}
 
