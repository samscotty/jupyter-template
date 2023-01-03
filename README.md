# Template Jupyter Notebook Environment

Repository template for creating Dockerised Jupyter environments.

## Usage

Create a new repository from the template.

Update the requirements file to manage additional package dependencies specific to the project.
Additional dependencies will be pip-installed in the Docker build.

Build the Docker image:

```sh
docker build -t jupyter-project .
```

Run the Docker container:

```sh
docker run --rm \
    -p 8888:8888 \
    -v $PWD/project:/home/jovyan/work \
    -w "/home/jovyan/work" \
    -h $USER \
    jupyter-project
```

## Notes

The Dockerfile uses the latest version of the `jupyter/scipy-notebook` base image from Jupyter Docker Stacks.

```dockerfile
ARG BASE_IMAGE=jupyter/scipy-notebook:latest
```
