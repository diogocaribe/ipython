FROM ubuntu:18.04

LABEL author="Diogo Caribé" \
      maintainer="dogosousa@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive

COPY ./sources.list /etc/apt/sources.list

RUN apt-get update && \
    apt-get install -yq --no-install-recommends \
        apt-utils \
        software-properties-common

RUN add-apt-repository ppa:ubuntugis/ubuntugis-unstable

RUN apt-get update && \
    apt-get install -yq --no-install-recommends \
        python3-pip \
        python3-dev \
        libgdal-dev \
        gdal-bin \
        python-gdal \
        python3-setuptools \
        g++ \
        ipython
   
RUN pip3 install --upgrade pip

RUN pip3 install jupyter \
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

RUN mkdir -p /opt/work

WORKDIR /opt/work

CMD ["jupyter", "notebook", "--no-browser", "--ip=0.0.0.0", "--allow-root"]