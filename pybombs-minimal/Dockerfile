FROM ubuntu:18.04
LABEL maintainer=martin@gnuradio.org

RUN DEBIAN_FRONTEND=noninteractive apt-get update -q
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python-pip python-apt apt-utils
RUN pip install --upgrade pip
RUN pip install pybombs
RUN pybombs auto-config
RUN pybombs config makewidth 2
