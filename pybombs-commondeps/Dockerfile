FROM pybombs-prefix
LABEL maintainer=martin@gnuradio.org

ARG makewidth=2

RUN pybombs config makewidth $makewidth
# Now list all the dependencies that we want to ship in this container:
RUN pybombs install python-requests libusb boost doxygen mako fftw cppunit \
                    swig gsl alsa cheetah wxpython numpy lxml pygtk pycairo \
                    pyqt4 qwt5 pyqwt5 apache-thrift liblog4cpp zeromq \
                    python-zmq autoconf libtool automake sip six
# We set it back to safe value before we finish
RUN pybombs config makewidth 2
