FROM pybombs/pybombs-prefix:2.3.4
LABEL maintainer=martin@gnuradio.org

# This allows setting the makewidth temporarily to a higher value
ARG makewidth=2

# Temporarily set frontend to noninteractive to avoid warnings
ARG DEBIAN_FRONTEND=noninteractive

# Ubuntu 20.04 gets stuck on tzdata configuration during build.
# Providing a default timezone that can be overridden using build-args:
ARG TZ=Etc/UTC
RUN ln -fs /usr/share/zoneinfo/$TZ /etc/localtime

RUN pybombs config makewidth $makewidth

# installing qwt5 will fail due to lack of X11 headers.
# Temp fix until this is solved in the pybombs recipe (see gnuradio/gr-recipes#197):
RUN apt-get update && apt-get install -y \
	libqwt-qt5-dev \
	python3-pyqt5.qwt

# Now list all the dependencies that we want to ship in this container:
# (I use separate RUN commands so I can maybe have an easier time building)
RUN pybombs install boost doxygen
RUN pybombs install libtool autoconf automake
RUN pybombs install sip lxml
RUN pybombs install pygtk pycairo python-requests six mako numpy
RUN pybombs install gsl fftw
RUN pybombs install zeromq python-zmq
RUN pybombs install libusb alsa
RUN pybombs install cppunit liblog4cpp

# We set it back to safe value before we finish
RUN pybombs config makewidth 2
