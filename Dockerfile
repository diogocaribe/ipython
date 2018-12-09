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
    python-setuptools \
    g++ \
    ipython 
    
RUN pip install --upgrade pip

RUN pip install jupyter \
        numpy \
        scipy \
        scikit-learn \
        matplotlib \
        setuptools \
        pygdal==2.3.2.4
        
EXPOSE 8888

CMD jupyter notebook


