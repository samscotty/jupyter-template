ARG BASE_IMAGE=jupyter/scipy-notebook:latest

FROM $BASE_IMAGE

# Switch to root (newer base image does not start off root)
USER root

# Install additional pip requirements
COPY requirements.txt /tmp/

RUN pip install -r /tmp/requirements.txt --no-cache-dir && \
    rm /tmp/requirements.txt

USER $NB_USER
