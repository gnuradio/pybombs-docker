FROM ubuntu:20.04
LABEL maintainer=martin@gnuradio.org

# Ubuntu 20.04 gets stuck on tzdata configuration during build.
# Providing a default timezone that can be overridden using build-args:
ARG TZ=Etc/UTC
RUN ln -fs /usr/share/zoneinfo/$TZ /etc/localtime

RUN DEBIAN_FRONTEND=noninteractive apt-get update -q
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python3-pip python3-apt apt-utils tzdata
RUN pip3 install --upgrade pip
RUN pip3 install pybombs
RUN pybombs auto-config
RUN pybombs config makewidth 2

