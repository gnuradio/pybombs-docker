FROM ubuntu:16.04
LABEL maintainer=martin@gnuradio.org

RUN DEBIAN_FRONTEND=noninteractive apt-get update -q
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python-pip python-apt
RUN pip install --upgrade pip
RUN pip install pybombs
