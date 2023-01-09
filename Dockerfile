ARG BASE_IMAGE=jupyter/scipy-notebook:latest

FROM $BASE_IMAGE

# Install from requirements.txt file
COPY --chown=${NB_UID}:${NB_GID} requirements.txt /tmp/
RUN pip install -r /tmp/requirements.txt --no-cache-dir && \
    rm /tmp/requirements.txt

# Install local Python packages
COPY --chown=${NB_UID}:${NB_GID} lib/ /tmp/lib/
COPY --chown=${NB_UID}:${NB_GID} scripts/ /tmp/scripts/
RUN /tmp/scripts/build_lib.sh "/tmp/lib/" && \
    rm -r /tmp/lib/ /tmp/scripts/
