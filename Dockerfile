ARG BASE_CONTAINER=jupyter/scipy-notebook:latest

FROM $BASE_CONTAINER

# Switch to root (newer base image does not start off root)
USER root

# Install additional pip requirements
COPY requirements.txt /tmp/

RUN pip install -r /tmp/requirements.txt --no-cache-dir

USER $NB_USER

EXPOSE 8888

CMD ["jupyter", "lab", "--NotebookApp.token=''"]
