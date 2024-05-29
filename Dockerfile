FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive

#COPY ./requirements.txt /requirements.txt

RUN mkdir /seemhews
RUN mkdir /home/tiles

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python

RUN apt-get update
RUN apt-get -y install gdal-bin
RUN apt-get -y install libgdal-dev
RUN export CPLUS_INCLUDE_PATH=/usr/include/gdal
RUN export C_INCLUDE_PATH=/usr/include/gdal

RUN apt-get -y install ffmpeg

RUN apt-get -y install libnetcdf-dev libnetcdff-dev libopenjp2-7-dev gcc gfortran make unzip git cmake wget

WORKDIR /

RUN pip install --upgrade pip

#RUN pip install -r /requirements.txt

RUN apt-get install -y apache2 --no-install-recommends; apt-get install -y libapache2-mod-wsgi-py3 --no-install-recommends


