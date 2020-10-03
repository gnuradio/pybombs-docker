FROM ubuntu:20.04
LABEL maintainer=martin@gnuradio.org

RUN DEBIAN_FRONTEND=noninteractive apt-get update -q
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python3-pip python3-apt apt-utils
RUN pip3 install --upgrade pip
RUN pip3 install pybombs
RUN pybombs auto-config
RUN pybombs config makewidth 2
