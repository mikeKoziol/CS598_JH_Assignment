FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y wget bzip2 curl ca-certificates && \
    rm -rf /var/lib/apt/lists/*

ENV CONDA_DIR=/opt/conda

RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda.sh && \
    /bin/bash /tmp/miniconda.sh -b -p $CONDA_DIR && \
    rm /tmp/miniconda.sh

ENV PATH=$CONDA_DIR/bin:$PATH

WORKDIR /kg_rag

# Create environment and install packages manually
RUN conda create -n kg_rag python=3.11 -y
RUN pip install -r ./requirements.txt