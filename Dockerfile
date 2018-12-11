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
        pathlib \
        scikit-image \
        pygdal==2.3.2.4
        
ENV TINI_VERSION v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini
ENTRYPOINT ["/usr/bin/tini", "--"]

EXPOSE 8888

CMD ["jupyter", "notebook", "--no-browser", "--ip=0.0.0.0", "--allow-root"]


