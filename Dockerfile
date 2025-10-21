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

COPY requirements.txt /kg_rag/

# Get cpp basics
RUN apt-get update && \
    apt-get install -y build-essential

# Accept the conda channels
RUN conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/main && \
    conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/r

# Create environment and install packages manually
RUN conda create -n kg_rag python=3.10.9 -y && \
    conda run -n kg_rag pip install --no-input -r requirements.txt && \
    rm -f /kg_rag/requirements.txt