set -e

# Build minimal image
echo "Building minimal image"
cd pybombs-minimal
docker build -t pybombs/pybombs-minimal:latest .
pbversion=`docker run --rm -it pybombs/pybombs-minimal:latest pybombs --version | tr -d '\r'`
docker tag pybombs/pybombs-minimal:latest pybombs/pybombs-minimal:$pbversion
echo "Successfully built pybombs/pybombs-minimal (tagged latest and $pbversion)"
echo ""

# Build prefix image
echo "Building prefix image"
cd ../pybombs-prefix
docker build -t pybombs/pybombs-prefix:latest .
docker tag pybombs/pybombs-prefix:latest pybombs/pybombs-prefix:$pbversion
echo "Successfully built pybombs/pybombs-prefix (tagged latest and $pbversion)"
echo ""

# Build commondeps image
echo "Building commondeps image"
cd ../pybombs-commondeps
numthreads=`nproc || 2`
docker build --build-arg makewidth=$numthreads -t pybombs/pybombs-commondeps:latest .
docker tag pybombs/pybombs-commondeps:latest pybombs/pybombs-commondeps:$pbversion
echo "Successfully built pybombs/pybombs-commondeps (tagged latest and $pbversion)"
echo ""

echo "Created the following images:"
docker images | grep pybombs/pybombs