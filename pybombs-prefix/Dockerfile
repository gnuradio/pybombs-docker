FROM pybombs/pybombs-minimal:2.3.4
LABEL maintainer=martin@gnuradio.org
# Create a prefix in /pybombs
RUN pybombs prefix init /pybombs -a default
# Add all the default recipe locations
RUN pybombs recipes add-defaults
