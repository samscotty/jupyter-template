ARG BASE_IMAGE=jupyter/scipy-notebook:latest

FROM $BASE_IMAGE

# Switch to root (newer base image does not start off root)
USER root

# Install additional pip requirements
COPY requirements.txt /tmp/

RUN pip install -r /tmp/requirements.txt --no-cache-dir && \
    rm /tmp/requirements.txt

# Install local Python packages
COPY scripts/build_lib.sh /tmp/

COPY lib/ /tmp/lib/

RUN /tmp/build_lib.sh "/tmp/lib/" "/tmp/lib/*/" && \
    rm -r /tmp/lib/ && \
    rm /tmp/build_lib.sh

USER $NB_USER
