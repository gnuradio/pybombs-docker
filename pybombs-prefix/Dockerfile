FROM pybombs-minimal
LABEL maintainer=martin@gnuradio.org

ARG makewidth=2

RUN pybombs config makewidth $makewidth
RUN pybombs config elevate_pre_args ''
RUN pybombs prefix init /pybombs -a default
RUN pybombs recipes add gr-recipes git+https://github.com/gnuradio/gr-recipes.git
RUN pybombs recipes add gr-etcetera git+https://github.com/gnuradio/gr-etcetera.git

