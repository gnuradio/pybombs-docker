# PyBOMBS: Common dependencies

This Docker container will provide a full installation of the latest PyBOMBS,
and will initialize an empty prefix. Furthermore, it will contain the most
common dependencies for most GNU Radio-related recipes. Calling `pybombs
install` will not only work without issues, it'll also be pretty fast as it
doesn't need install lots of dependencies.

## Note on tzdata configuration

This container configures the timezone to `Etc/UTC` by default. You can change
this behavior either at build-time or at run-time.

### Build-time 

To build this container with sensible tzdata for your region, simply provide a
`TZ` argument to the build command:

    docker build --build-args TZ=America/New_York -t pybombs-commondeps .

### Run-time

At run-time, reconfigure the timezone to a sensible value for your region by
running

    dpkg-reconfigure tzdata
