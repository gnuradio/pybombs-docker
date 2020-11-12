# Base container for PyBOMBS

This container will install Python and pip, and then use the latter to install
the latest version of PyBOMBS.

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
