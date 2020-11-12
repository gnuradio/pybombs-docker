#!/bin/bash
set -e
set -o pipefail

cmd=${1-usage}
org=${org-pybombs}
default_images="pybombs-minimal pybombs-prefix pybombs-commondeps"

case $cmd in
    build )
        images=${2-$default_images}
        moreargs="${@:3}"
        for img in $images; do
                echo -e "\e[1;36mBuilding $org/$img:latest ...\e[0m"
                cd $img
                docker build --build-arg makewidth=`nproc` $moreargs -t $org/$img:latest .
                pbversion=`docker run --rm -it $org/$img:latest pybombs --version | tr -d '\r'`
                docker tag $org/$img:latest $org/$img:$pbversion
                echo -e "\e[1;36mSuccessfully built pybombs/pybombs-$img (tagged latest and $pbversion).\e[0m"
                cd ..
                echo ""
        done
        echo -e "\e[1;36mCreated the following images:\e[0m"
        docker images | grep $org/
        ;;
    push )
        img=${2-_}
        tags=${3-_}
        if [[ $img = "_" ]]; then
            echo "${0} ${1} requires an image name passed as an argument."
            exit 1
        fi
        if [[ $tags = "_" ]]; then
            tags=`docker images --format "{{.Repository}}:{{.Tag}}" | grep "$org/$img" | cut -d':' -f2`
        fi
        for tag in $tags; do
                echo -e "\e[1;36mPushing $org/$img:$tag ...\e[0m"
            docker push "$org/$img:$tag"
        done
        ;;
    update )
        images=${2-$default_images}
        echo -e "\e[1;36mBuild $images ...\e[0m"
        for img in $images; do
            ${0} build $img --no-cache
        done
        echo -e "\e[1;36mPush $images ...\e[0m"
        for img in $images; do
            ${0} push $img
        done
        ;;
    clean )
        echo -e "\e[1;36mCleaning up ...\e[0m"
        rmi=`docker images --format "{{.Repository}}:{{.Tag}}" | grep "$org/"`
        for r in $rmi; do
            docker rmi $r && echo -e "\e[1;36mRemoved $r.\e[0m"
        done
        echo -e "\e[1;36mPrune images?\e[0m"
        read -p "y / n " yn
        case $yn in
            [Yy]* ) yes | docker image prune;;
            [Nn]* ) exit;;
            * ) echo "Please answer yes or no.";;
        esac
        ;;
    * )
        cat <<USAGE
Usage:
./build.sh <command> [...]

Commands:
    - build [<image>]       Builds <image>, or all images if no argument is 
                            provided.
    - push <image> [<tag>]  Pushes <image>:<tag>, or all available tags if no
                            argument is provided.
    - update [<image>]      Builds and pushes <image> with all current tags,
                            or all images if no <image> is provided.
    - clean                 Remove local ${org}/* images.
    - usage                 Show this message.

USAGE

esac

exit

