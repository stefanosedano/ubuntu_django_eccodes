FROM ubuntu:latest
#bionic
ENV DEBIAN_FRONTEND=noninteractive

COPY ./requirements.txt /requirements.txt

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
#RUN mkdir /usr/src/eccodes
#RUN mkdir /source_builds
#RUN mkdir /source_builds/eccodes
#RUN mkdir /source_builds/eccodes/build
#WORKDIR /source_builds/eccodes
#RUN wget https://confluence.ecmwf.int/download/attachments/45757960/eccodes-2.22.1-Source.tar.gz?api=v2
#RUN tar -xzf eccodes-2.22.1-Source.tar.gz?api=v2
#WORKDIR /source_builds/eccodes/build
#RUN cmake -DCMAKE_INSTALL_PREFIX=/usr/src/eccodes -DENABLE_JPG=ON ../eccodes-2.22.1-Source
#RUN make
#RUN ctest
#RUN make install
#RUN cp -r /usr/src/eccodes/bin/*  /usr/bin/
#RUN echo 'export ECCODES_DIR=/usr/src/eccodes'
#RUN echo 'export ECCODES_DEFINITION_PATH=/usr/src/eccodes/share/eccodes/definitions'
#RUN cp /usr/src/eccodes/lib/libeccodes.so /usr/lib/x86_64-linux-gnu
#RUN cp /usr/src/eccodes/include/* /usr/include/
WORKDIR /

RUN pip install --upgrade pip

RUN pip install -r /requirements.txt

RUN apt-get install -y apache2 --no-install-recommends; apt-get install -y libapache2-mod-wsgi-py3 --no-install-recommends


