FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive

# Add deadsnakes PPA and install Python 3.8
RUN apt-get update \
  && apt-get install -y software-properties-common \
  && add-apt-repository ppa:deadsnakes/ppa \
  && apt-get update \
  && apt-get install -y python3.8 python3.8-dev python3.8-venv \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3.8 python \
  && ln -s /usr/bin/python3.8 python3

COPY ./requirements.txt /requirements.txt

RUN mkdir /seemhews
RUN mkdir /home/tiles

RUN apt-get update
RUN apt-get -y install gdal-bin
RUN apt-get -y install libgdal-dev
RUN export CPLUS_INCLUDE_PATH=/usr/include/gdal
RUN export C_INCLUDE_PATH=/usr/include/gdal

RUN apt-get -y install ffmpeg

RUN apt-get -y install libnetcdf-dev libnetcdff-dev libopenjp2-7-dev gcc gfortran make unzip git cmake wget

WORKDIR /

RUN python3.8 -m ensurepip
RUN python3.8 -m pip install --upgrade pip

RUN pip install -r /requirements.txt

RUN apt-get install -y apache2 --no-install-recommends; apt-get install -y libapache2-mod-wsgi-py3 --no-install-recommends
