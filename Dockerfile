FROM python:3.9-slim-buster

WORKDIR /app

ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"
RUN apt-get update

RUN apt-get install -y wget && rm -rf /var/lib/apt/lists/*

RUN wget \
    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && mkdir /root/.conda \
    && bash Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh
RUN conda --version

RUN conda create -n gdal_test python=3.9
RUN activate gdal_test
RUN conda install gdal

RUN apt-get update
RUN apt-get -y install gcc

COPY requirements.txt requirements.txt
RUN python3 -m pip install -r requirements.txt

COPY .. .

CMD [ "python3", "manage.py", "runserver", "0.0.0.0:8000" ]
