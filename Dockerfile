FROM python:3.11

RUN apt-get update && \
    apt-get install -y wget

COPY requirements.txt .

COPY llama.cpp/ llama.cpp/

RUN pip install --upgrade pip && \
    pip install --upgrade setuptools && \
    pip install -r requirements.txt

RUN cd llama.cpp && pip install -r requirements.txt

ARG workdir=/projects/
WORKDIR $workdir
