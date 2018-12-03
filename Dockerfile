FROM ubuntu:18.04

LABEL author="Diogo Caribé" \
      maintainer="dogosousa@gmail.com"

RUN apt-get update && \
    apt-get install -y --no-install-recommends apt-utils software-properties-common

RUN add-apt-repository ppa:ubuntugis/ubuntugis-unstable && apt-get update

RUN apt-get install -y --no-install-recommends apt-utils \
    python-pip \
    python-dev \
    libgdal-dev \
    gdal-bin \
    python-gdal \
    ipython 
    
RUN pip install --upgrade pip

RUN pip install jupyter \
        numpy \
        scipy \
        sklearn \
        matplotlib \
        pygdal==2.2.3.3
        
EXPOSE 8888


