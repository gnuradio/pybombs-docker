set -e

images="minimal prefix commondeps"
for img in $images; do
    echo -e "\e[1;36mBuilding pybombs-$img ...\e[0m"
    cd pybombs-$img
    docker build -t pybombs/pybombs-$img:latest .
    pbversion=`docker run --rm -it pybombs/pybombs-$img:latest pybombs --version | tr -d '\r'`
    docker tag pybombs/pybombs-$img:latest pybombs/pybombs-$img:$pbversion
    echo -e "\e[1;36mSuccessfully built pybombs/pybombs-$img (tagged latest and $pbversion).\e[0m"
    cd ..
    echo ""
done

echo -e "\e[1;36mCreated the following images:\e[0m"
docker images | grep pybombs/pybombs