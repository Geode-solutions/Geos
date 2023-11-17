FROM python:3-slim

WORKDIR /geos

# Upgrade system and package manager
RUN apt-get update && apt-get upgrade
# Install tools for C++
RUN apt-get install -y cmake git build-essential git-lfs gfortran libopenblas-dev bison flex libopenmpi-dev

# Copy configure file code here
# replace the environment.cmake?
COPY geode.cmake .

# get geos code
RUN git clone https://github.com/GEOS-DEV/GEOS.git && \
    cd GEOS && \
    git lfs install && \
    git submodule init && \
    git submodule deinit integratedTests && \
    git submodule update

# get geos third parties
RUN git clone https://github.com/GEOS-DEV/thirdPartyLibs.git && \
    cd thirdPartyLibs && \
    git lfs install && \
    git pull && \
    git submodule init && \
    git submodule update

RUN cd thirdPartyLibs && \
    python scripts/config-build.py -hc /geos/geode.cmake -bt Release -ip /usr/local && \
    cd build-geode-release && \
    make -j

RUN cd GEOS && \
    python scripts/config-build.py -hc /geos/geode.cmake -bt Release -ip /usr/local && \
    cd build-geode-release && \
    make -j  && \
    make install

WORKDIR /

RUN rm -rf /geos && apt-get purge cmake git build-essential git-lfs
